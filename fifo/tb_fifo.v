`timescale 1ns/1ps

module tb_fifo;

    reg clk;
    reg rst;

    reg        wr_en;
    reg        rd_en;
    reg [7:0]  data_in;

    wire [7:0] data_out;
    wire       full;
    wire       empty;

    fifo #(
        .DATA_WIDTH(8),
        .DEPTH(8)
    ) uut (
        .clk(clk),
        .rst(rst),
        .wr_en(wr_en),
        .rd_en(rd_en),
        .data_in(data_in),
        .data_out(data_out),
        .full(full),
        .empty(empty)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Write task
    task write_data;
        input [7:0] data;
        begin
            @(negedge clk);
            wr_en = 1'b1;
            data_in = data;

            @(negedge clk);
            wr_en = 1'b0;
        end
    endtask

    // Read task
    task read_data;
        begin
            @(negedge clk);
            rd_en = 1'b1;

            @(negedge clk);
            rd_en = 1'b0;
        end
    endtask

    initial begin

        $dumpfile("fifo.vcd");
        $dumpvars(0, tb_fifo);

        $monitor("Time=%0t | WR=%b | RD=%b | DATA_IN=%h | DATA_OUT=%h | FULL=%b | EMPTY=%b",
                 $time,
                 wr_en,
                 rd_en,
                 data_in,
                 data_out,
                 full,
                 empty);

        clk = 0;
        rst = 1;
        wr_en = 0;
        rd_en = 0;
        data_in = 8'h00;

        #12;
        rst = 0;

        // Write four values
        write_data(8'hA1);
        write_data(8'hB2);
        write_data(8'hC3);
        write_data(8'hD4);

        // Read four values
        read_data;
        read_data;
        read_data;
        read_data;

        // Write more data
        write_data(8'h11);
        write_data(8'h22);

        // Read data
        read_data;
        read_data;

        #20;

        $finish;

    end

endmodule