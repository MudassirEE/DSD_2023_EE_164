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
vcom -93 -f compile.f

# Run the first simulation.
vsim interleaver_tester -nopsl 
set StdArithNoWarnings 1
onbreak {resume}
run -all
quit -sim

# Run the second simulation with assertions.
vsim interleaver_tester -assertdebug -GBUG=1 
do nofc_sim.do
quit -sim

# Run the third simulation with functional coverage.
vsim  interleaver_tester -GRUNFC=1 -GBUG=0 
do sim.do 
run 70 us

quit -f
