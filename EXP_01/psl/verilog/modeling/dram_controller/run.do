#
# Unpublished work. Copyright 2024 Siemens
#
# This material contains trade secrets or otherwise confidential information 
# owned by Siemens Industry Software Inc. or its affiliates (collectively, 
# "SISW"), or its licensors. Access to and use of this information is strictly 
# limited as set forth in the Customer's applicable agreements with SISW.
#
# This material may not be copied, distributed, or otherwise disclosed outside 
# of the Customer's facilities without the express written permission of SISW, 
# and may not be used in any way not expressly authorized by SISW.
#
# To run this example, bring up the simulator and type the following at the prompt:
#     do run.do
# or, to run from a shell, type the following at the shell prompt:
#     vsim -do run.do -c
# (omit the "-c" to see the GUI while running from the shell)
# Remove the "quit -f" command from this file to view the results in the GUI.
#

# Create the library.
if [file exists work] {
    vdel -all
}
vlib work

# Compile the source files.
vlog dram.v
vlog +define+BUG=1 dramcon_rtl.sv -pslfile dram_cntrl.psl
vlog dramcon_sim.v -pslfile dram_tb.psl

# Run the first simulation without psl.
vsim -nopsl -voptargs="+acc" work.tb
onbreak {resume}
run -all
quit -sim

# Run the second simulation with psl.
vsim -voptargs="+acc" work.tb 
onbreak {resume}
run -all

quit -f
