all : controlunit rslatch1bit  dlatch1bit dlatchnbit halfadder1bit fulladder1bit fulladdernbit  notnbit  minusnbit subbernbit shiftregnbit  multnbit mux10to1nbit registernbit  alunbit  cpunbit wrapper

subbernbit : subbernbit.o
	ghdl -e subbernbit

subbernbit.o : subbernbit.vhd
	ghdl -a subbernbit.vhd

alunbit : alunbit.o
	ghdl -e alunbit

alunbit.o : alunbit.vhd
	ghdl -a alunbit.vhd

controlunit : controlunit.o
	ghdl -e controlunit

controlunit.o : controlunit.vhd
	ghdl -a controlunit.vhd

cpunbit : cpunbit.o
	ghdl -e cpunbit

cpunbit.o : cpunbit.vhd
	ghdl -a cpunbit.vhd

dlatch1bit : dlatch1bit.o
	ghdl -e dlatch1bit

dlatch1bit.o : dlatch1bit.vhd
	ghdl -a dlatch1bit.vhd

dlatchnbit : dlatchnbit.o
	ghdl -e dlatchnbit

dlatchnbit.o : dlatchnbit.vhd
	ghdl -a dlatchnbit.vhd
halfadder1bit : halfadder1bit.o
	ghdl -e halfadder1bit

halfadder1bit.o : halfadder1bit.vhd
	ghdl -a halfadder1bit.vhd


fulladder1bit : fulladder1bit.o
	ghdl -e fulladder1bit

fulladder1bit.o : fulladder1bit.vhd
	ghdl -a fulladder1bit.vhd

fulladdernbit : fulladdernbit.o
	ghdl -e fulladdernbit

fulladdernbit.o : fulladdernbit.vhd
	ghdl -a fulladdernbit.vhd

minusnbit : minusnbit.o
	ghdl -e minusnbit

minusnbit.o : minusnbit.vhd
	ghdl -a minusnbit.vhd

multnbit : multnbit.o
	ghdl -e multnbit

multnbit.o : multnbit.vhd
	ghdl -a multnbit.vhd

mux10to1nbit : mux10to1nbit.o
	ghdl -e mux10to1nbit

mux10to1nbit.o : mux10to1nbit.vhd
	ghdl -a mux10to1nbit.vhd

notnbit : notnbit.o
	ghdl -e notnbit

notnbit.o : notnbit.vhd
	ghdl -a notnbit.vhd

registernbit : registernbit.o
	ghdl -e registernbit

registernbit.o : registernbit.vhd
	ghdl -a registernbit.vhd

rslatch1bit : rslatch1bit.o
	ghdl -e rslatch1bit

rslatch1bit.o : rslatch1bit.vhd
	ghdl -a rslatch1bit.vhd

shiftregnbit : shiftregnbit.o
	ghdl -e shiftregnbit

shiftregnbit.o : shiftregnbit.vhd
	ghdl -a shiftregnbit.vhd

wrapper : wrapper.o
	ghdl -e wrapper

wrapper.o : wrapper.vhd
	ghdl -a wrapper.vhd

clean : 
	rm -f *~ *.o *.cf e~*.o alunbit controlunit cpunbit dlatch1bit dlatchnbit fulladder1bit fulladdernbit halfadder1bit minusnbit multnbit mux10to1nbit notnbit registernbit rslatch1bit shiftregnbit wrapper
