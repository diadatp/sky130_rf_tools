addpath('~/opt/openEMS/share/CSXCAD/matlab');
addpath('~/opt/openEMS/share/openEMS/matlab');
addpath('~/opt/openEMS/share/CTB/matlab');

close all
clear
clc

% Setup FDTD parameter & excitation function
% frequency range of interest
f_start = 1e6;
f_stop  = 100e9;

f_0 = 0.5 * (f_start + f_stop)
f_c = f_stop - f_0

% specify unit for rest of geometry
unit = 1e-6;

% calculate the FDTD mesh size constraint
lambda_0 = 3e8 / f_0;
lambda_max = lambda_0 / 15 / unit

% options for openems see official docs for explanation
openEMS_opts = '';
% openEMS_opts = [openEMS_opts ' --disable-dumps'];
% openEMS_opts = [openEMS_opts ' --debug-material'];
% openEMS_opts = [openEMS_opts ' --debug-PEC'];
% openEMS_opts = [openEMS_opts ' --debug-operator'];
% openEMS_opts = [openEMS_opts ' --debug-boxes'];
% openEMS_opts = [openEMS_opts ' --debug-CSX'];
% openEMS_opts = [openEMS_opts ' --engine=fastest'];
% openEMS_opts = [openEMS_opts ' --numThreads=1'];
% openEMS_opts = [openEMS_opts ' --no-simulation'];
openEMS_opts = [openEMS_opts ' --dump-statistics'];
% openEMS_opts = [openEMS_opts ' -vvv'];

% where to store the sim files and what to call them
Sim_Path = 'tmp_openems';
Sim_CSX = 'geometry.xml';

FDTD = InitFDTD();
% FDTD = InitFDTD('NrTS', 1e6, 'EndCriteria', 1e-6);
FDTD = SetGaussExcite( FDTD, f_0, f_c );

% not the best, look into FDTD BC
BC = {'PMC' 'PMC' 'PMC' 'PMC' 'PEC' 'PMC'};
FDTD = SetBoundaryCond(FDTD, BC);

CSX = InitCSX();

% create the skywter specific geometry like dielectric
CSX = create_sky130_geometry(CSX, -150, 150, -200, 150, unit);

% create the structure that you want to simulate
[CSX, port] = create_geometry(CSX);

mesh = DetectEdges(CSX);

mesh.x = [mesh.x linspace(-150, 150, 15) 3.8 -3.8];
mesh.y = [mesh.y linspace(-200, 150, 15) -152 -148];
mesh.z = [mesh.z 400 linspace(-400, 400, 15)];

% FIXME error when using smooth mesh and DetectEdges
% mesh = SmoothMesh(mesh, lambda_max);
% mesh = SmoothMesh(mesh, 200);

CSX = DefineRectGrid(CSX, unit, mesh);

% dump box for cool GIF
% CSX = AddDump(CSX, 'Et');
% CSX = AddBox(CSX, 'Et', 10, [-60 -90 5.3711], [60 60 6.6311]);

% CSX = AddDump(CSX, 'Ht', 'DumpType', 1);
% CSX = AddBox(CSX, 'Ht', 10, [-60 -90 5.3711], [60 60 6.6311]);

WriteOpenEMS([Sim_Path '/' Sim_CSX], FDTD, CSX);

CSXGeomPlot([Sim_Path '/' Sim_CSX]);

RunOpenEMS( Sim_Path, Sim_CSX, openEMS_opts );

f = linspace( f_0 - f_c, f_0 + f_c, 8196 );
w = 2 * pi * f;

port = calcPort(port, Sim_Path, f, 'RefImpedance', 50);
