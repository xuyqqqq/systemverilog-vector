/**
 * @file vector.sv
 * @author Ryan 
 * @brief 
 * @version 0.1
 * @date 2025-04-18
 * 
 * @copyright Copyright (c) MIT License
 * 
 * @par ChangeLog:
 * <table>
 *     Date            Version        Author        Description
 *     2025-04-18      v0.1           Ryan
 * </table>
 */
`ifndef _VECTOR_SV_
`define _VECTOR_SV_
class vector #(type T=int);
    protected T data[$];
    string name;
    function new(string vector_name="Vector");
        name = vector_name;
    endfunction

    function void push(T value);
        data.push_back(value);
    endfunction

    function T pop();
        if (data.size() == 0) begin
            $display($sformatf("%s:Error: Vector is empty", name));
            $stop;
            return '0;
        end

        return data.pop_front();
    endfunction

    function T get(int index);
        if (index < 0 || index >= data.size()) begin
            $display($sformatf("%s:Error: Index out of bounds", name));
            $stop;
            return '0;
        end
        return data[index];
    endfunction

    function int size();
        return data.size();
    endfunction

    function void clear();
        data.delete();
    endfunction
endclass
`endif