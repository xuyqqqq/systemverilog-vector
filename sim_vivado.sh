#!/bin/sh

xvlog --sv vector_tb.sv
xelab vector_tb 
xsim vector_tb -t sim.tcl
