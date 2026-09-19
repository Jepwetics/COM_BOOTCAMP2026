module tt_um_traffic_light (
    input  [7:0] ui_in,
    output [7:0] uo_out,
    input        ena,
    input        clk,
    input        rst_n
);

    // Traffic light states
    localparam GREEN  = 2'b00;
    localparam YELLOW = 2'b01;
    localparam RED    = 2'b10;

    reg [1:0] state;

    // State machine
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state <= GREEN;
        end else begin
            case (state)
                GREEN:  state <= YELLOW;
                YELLOW: state <= RED;
                RED:    state <= GREEN;
                default: state <= GREEN;
            endcase
        end
    end

    // Outputs
    always @(*) begin
        uo_out = 8'b00000000;

        case (state)
            GREEN: begin
                uo_out[0] = 1'b1;
            end

            YELLOW: begin
                uo_out[1] = 1'b1;
            end

            RED: begin
                uo_out[2] = 1'b1;
            end

            default: begin
                uo_out = 8'b00000000;
            end
        endcase
    end

endmodule
