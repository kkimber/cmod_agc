#!/usr/bin/env python3

import re
import sys


def parse_coe(filename):
    with open(filename, "r") as f:
        text = f.read()

    # Extract radix
    m = re.search(r"memory_initialization_radix\s*=\s*(\d+)\s*;",
                  text, re.IGNORECASE)
    if not m:
        raise ValueError("Could not find memory_initialization_radix")

    radix = int(m.group(1))

    # Extract initialization vector
    m = re.search(
        r"memory_initialization_vector\s*=\s*(.*?)\s*;",
        text,
        re.IGNORECASE | re.DOTALL
    )

    if not m:
        raise ValueError("Could not find memory_initialization_vector")

    data_text = m.group(1)

    values = [
        v.strip()
        for v in data_text.replace("\n", "").split(",")
        if v.strip()
    ]

    return radix, values


def bits_required(values, radix):
    max_val = max(int(v, radix) for v in values)

    width = 1
    while (1 << width) <= max_val:
        width += 1

    return width


def write_mif(filename, radix, values, width=None):
    depth = len(values)

    if width is None:
        width = bits_required(values, radix)

    radix_name = {
        2: "BIN",
        10: "DEC",
        16: "HEX"
    }.get(radix)

    if radix_name is None:
        raise ValueError(f"Unsupported radix: {radix}")

    with open(filename, "w") as f:
        f.write(f"DEPTH = {depth};\n")
        f.write(f"WIDTH = {width};\n\n")

        f.write("ADDRESS_RADIX = HEX;\n")
        f.write(f"DATA_RADIX = {radix_name};\n\n")

        f.write("CONTENT BEGIN\n")

        addr_width = max(1, len(f"{depth-1:X}"))

        for addr, value in enumerate(values):
            f.write(f"    {addr:0{addr_width}X} : {value};\n")

        f.write("END;\n")


def main():
    if len(sys.argv) != 3:
        print("Usage:")
        print("  python coe_to_mif.py input.coe output.mif")
        sys.exit(1)

    coe_file = sys.argv[1]
    mif_file = sys.argv[2]

    radix, values = parse_coe(coe_file)

    # For your rope memory:
    # 16-bit words expected
    write_mif(mif_file, radix, values, width=16)

    print(f"Converted {len(values)} words")
    print(f"Wrote {mif_file}")


if __name__ == "__main__":
    main()