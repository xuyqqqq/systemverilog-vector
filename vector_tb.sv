/**
 * @file vector_tb.sv
 * @author Ryan
 * @brief 
 * @version 0.1
 * @date 2025-04-18
 * 
 * @copyright Copyright (c) MIT license
 * 
 * @par ChangeLog:
 * <table>
 *     Date            Version        Author        Description
 *     2025-04-18      v0.1           Ryan
 * </table>
 */
`timescale 1ns/1ps

`include "vector.sv"
program vector_tb();
    mailbox #(vector #(integer)) vector_fifo;

    task vector_test();
        vector#(integer) test_vec = new("test");
        vector#(integer) data;

        test_vec.push(1);
        test_vec.push(2);

        vector_fifo.put(test_vec);

        test_vec = new("test1");
        test_vec.push(3);
        
        vector_fifo.put(test_vec);
        forever begin
            vector_fifo.get(data);
            $display("c2sv data size = %d",data.size());
        end
    endtask


    initial begin
        vector_fifo = new();
        vector_test();
    end
endprogram