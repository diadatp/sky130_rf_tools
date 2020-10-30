The first step I had to take was design a DRC clean inductor in the SKY130 process. Rather than doing it by hand I used [openPCells](https://github.com/patrickschulz/openPCells) to generate the design. It has a simple interface and ready made examples for spiral inductors of different shapes. I chose the square inductor with conductor width 6um, spacing 6um and three turns. A small modification of example to place the ports where I wanted them and a run through Klayout to fix a polygon bug resulted in the following design:

```sh
./opc -T skywater130 -I gds -C spiral_inductor --turns=3 --width=6 --spacing=6 --innerradius=25 --extension=25
```
<img src="https://raw.githubusercontent.com/diadatp/sky130_rf_tools/main/ind_3t_6w_6s_25r.svg" width="150" height="150"/>

```sh
git clone https://github.com/ediloren/FastHenry2.git
cd FastHenry2
make all

export PATH=$(pwd)/bin:$PATH
```

To generate the FH2 input files, thankfully OPC has a debug interface that can be (ab)used to output an FH2 description.

## vizualization
fasthenry square_spiral_inductor_6_6_25.fh -f refined && zbuf zbuffile2 && evince zbuffile2.ps

## simplified analytical calculation

set expectation to check them in the tools

### calculating R from length to first order
### calculating L using many of the available formulae

## single port extraction of a toy ind

(universe with only an inductor)
graph with matplotlib in svg?

```sh
fasthenry square_spiral_inductor_6_6_25.fh && ReadOutput Zc.mat
```

## recovering skin effect with logarithmic subdivision

compare with graph above
draw trendline for skin effect dependence

## introducing uniform ground plain (starting to make sense)

describe how slow it is with this many elements and introduce nonuniform ground

## two port extraction wrt ground

show the contribution of low silicon conductivity

## model export

show how to turn the output file into a spice netlist with mutual coupling
setup the intuitive explanation for self resonance frequency and need for fastercap

## automation

show [iterate_fh.py](fasthenry/iterate_fh.py)

