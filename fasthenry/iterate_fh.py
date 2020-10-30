#!/usr/bin/env python3

import argparse
from itertools import product
import os
import subprocess
import tempfile

from mpl_toolkits.mplot3d import Axes3D
import matplotlib.pyplot as pl
import numpy as np
import parse

fig = pl.figure()
ax = fig.add_subplot(111, projection='3d')

turns_range = np.arange(5, 6)
width_range = np.linspace(1.6, 10, 10) * 1e-6
spacing_range = np.linspace(1.6, 10, 10) * 1e-6
iradius_range = np.linspace(20, 50, 10) * 1e-6

for turns, width, spacing, iradius in product(turns_range, width_range, spacing_range, iradius_range):

    height = 5.3711e-6
    thickness = 1.26e-6

    sigma = 1 / (thickness * 29e-3)

    guesstiamte_res = 4 * ((turns / 2) * (2 * (2 * iradius + width) + ((turns - 1) * (2 * (width + spacing))))) / width * 29e-3

    f = tempfile.NamedTemporaryFile(mode='w', delete=False)

    f.write(f"* File generated by ??? on ???\n")
    f.write(f".Default nhinc={1} nwinc={1}\n")

    for turn in range(0, turns):
        xy = iradius + 0.5 * width + turn * (width + spacing)
        t = turn * 10

        f.write(f"N{1+t} x={-xy + spacing + width:.6e} y={-xy:.6e} z={height:.6e}\n")
        f.write(f"N{2+t} x={+xy:.6e} y={-xy:.6e} z={height:.6e}\n")
        f.write(f"N{3+t} x={+xy:.6e} y={+xy:.6e} z={height:.6e}\n")
        f.write(f"N{4+t} x={-xy:.6e} y={+xy:.6e} z={height:.6e}\n")
        f.write(f"N{5+t} x={-xy:.6e} y={-xy - width/2:.6e} z={height:.6e}\n")

        f.write(f"E{1+t} N{1+t} N{2+t} w={width:.6e} h={thickness:.6e} sigma={sigma:.6e}\n")
        f.write(f"E{2+t} N{2+t} N{3+t} w={width:.6e} h={thickness:.6e} sigma={sigma:.6e}\n")
        f.write(f"E{3+t} N{3+t} N{4+t} w={width:.6e} h={thickness:.6e} sigma={sigma:.6e}\n")
        f.write(f"E{4+t} N{4+t} N{5+t} w={width:.6e} h={thickness:.6e} sigma={sigma:.6e}\n")

        if turn > 0:
            f.write(f"E{5+t} N{1+t} N{5+t-10} w={width:.6e} h={thickness:.6e} sigma={sigma:.6e}\n")

    f.write(f".External N{1} N{5 + 10 * (turns - 1)} P{1}\n")

    f.write(f".Freq fmin={1e10:e} fmax={1e10:e} ndec=1\n")

    f.write(f".End")
    f.close()

    output = subprocess.run(["fasthenry", f.name], stdout=subprocess.PIPE)
    os.unlink(f.name)

    freq_line = parse.compile("Impedance matrix for frequency = {freq:g} {rows:d} x {cols:d}\n")

    with open("Zc.mat", "r") as f:
        for line in f:
            data = freq_line.parse(line)
            if data != None:
                g = []
                for x in range(0, data['rows']):
                    line = f.readline().replace('j', '').split()
                    s = np.asarray(line, dtype=float)
                    s = s[::2] + s[1::2] * 1j
                    g.append(s)
                Z = np.stack(g)
                impedance = Z.sum()
                resistance = np.real(impedance)
                inductance = np.imag(impedance) / 2 / np.pi / data['freq']
                Q = np.imag(impedance) / np.real(impedance)
                side = 2 * (iradius + width + (turns - 1) * (width + spacing))
                area = side**2
                ax.scatter(spacing / 1e-6, side / 1e-6, inductance)
                # ax.scatter(turns, iradius, Q)
                # ax.scatter(area**0.5 / (100e-6), inductance / 1e-9, Q)
                print(inductance / 1e-9, turns, width / 1e-6, spacing / 1e-6, (iradius + width + (turns - 1) * (width + spacing)) / 1e-6, area**0.5 / 1e-6, Q)

pl.show()