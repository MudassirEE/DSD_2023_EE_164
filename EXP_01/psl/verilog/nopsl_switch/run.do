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
#     do run_nopsl.do
# or, to run from a shell, type the following at the shell prompt:
#     vsim -do run_nopsl.do -c
# (omit the "-c" to see the GUI while running from the shell)
#

# Create the library.
if [file exists work] {
    vdel -all
}
vlib work

# Compile the source files with psl.
vlog test.v -pslfile test.psl

# Run the first simulation with psl.
vsim work.tb -l results/transcript1
onbreak {resume}
run 1000

# Run the second simulation without psl.
vsim -nopsl work.tb -l results/transcript2
onbreak {resume}
run 1000

# Compile the source files with -nopsl switch.
vlog -nopsl test.v -pslfile test.psl

# Run the third simulation with psl.
vsim work.tb -l results/transcript3
onbreak {resume}
run 1000

# Run the fourth simulation without psl.
vsim -nopsl work.tb -l results/transcript4
onbreak {resume}
run 1000

quit -f

