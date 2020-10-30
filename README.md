# sky130_rf_tools

This repository details my experiences with running open source RF design tools for designs in the 130nm SkyWater SKY130 process. It also contains config files and material properties in tool specific formats.

To get familiar with the tools I decided to design and characterize on chip inductors. I picked inductors as there's plenty of literature about them and the design space is huge. For a given inductance and performance, apart from the high level desisions like width, spacing, number of turns and inner radius, decisions like which metal layer to use, the layout of the inductor and its symmetry, the use of a slotted ground plane are easy to understand in isolation but when put together, analysis becomes hard. Also, inductors have well defined figures of merit like <img src="https://render.githubusercontent.com/render/math?math=Q"> qualiry factor and <img src="https://render.githubusercontent.com/render/math?math=f_{SR}"> (self resonance frequency) that can be extracted by scripts.

The tools I've tested so far:
openPCells : pcell generator
FastHenry2 : inductance and resistance extraction
FasterCap  : capacitance extraction
OpenEMS    : FDTD EM simulations

Tools I want to test:
scuff-em
xschem with tcl automation
Qucs

<img src="https://raw.githubusercontent.com/diadatp/sky130_rf_tools/ind_3t_6w_6s_25r.svg" width="150" height="150"/>

In [part1](part1.md) is about laying out the inductor and running it through FastHenry2.
The [part2](part2.md) deals with modeling capacitive contributions and combining the results to create a narrowband SPICE model.
The third uses OpenEMS to run some VERY long simulations that give more or less the same answer (so far).
