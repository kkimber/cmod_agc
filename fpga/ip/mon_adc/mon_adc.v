module mon_adc(
    input  wire [15:0] di_in,
    input  wire [6:0]  daddr_in,
    input  wire        den_in,
    input  wire        dwe_in,
    output reg         drdy_out,
    output reg [15:0]  do_out,
    input  wire        dclk_in,
    input  wire        reset_in,

    input  wire vp_in,
    input  wire vn_in,
    input  wire vauxp4,
    input  wire vauxn4,
    input  wire vauxp12,
    input  wire vauxn12,

    output reg [4:0] channel_out,
    output wire eoc_out,
    output wire alarm_out,
    output wire eos_out,
    output wire busy_out
);

assign eoc_out   = 1'b1;
assign eos_out   = 1'b1;
assign alarm_out = 1'b0;
assign busy_out  = 1'b0;

always @(posedge dclk_in or posedge reset_in) begin
    if (reset_in) begin
        channel_out <= 5'h00;
        do_out      <= 16'h0000;
        drdy_out    <= 1'b0;
    end else begin
        drdy_out <= 1'b1;

        case (channel_out)
            5'h00: begin // TEMP
                do_out <= 16'h5000;
                channel_out <= 5'h01;
            end

            5'h01: begin // VCCINT
                do_out <= 16'h8000;
                channel_out <= 5'h02;
            end

            5'h02: begin // VCCAUX
                do_out <= 16'h8000;
                channel_out <= 5'h14;
            end

            5'h14: begin // VAUX4
                do_out <= 16'h4000;
                channel_out <= 5'h1C;
            end

            5'h1C: begin // VAUX12
                do_out <= 16'h4000;
                channel_out <= 5'h00;
            end

            default: begin
                do_out <= 16'h0000;
                channel_out <= 5'h00;
            end
        endcase
    end
end

endmodule