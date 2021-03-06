function [CSX, port] = create_geometry ( CSX )

p = [];
% p(1,1) = 3.4000;
% p(2,1) = -51.2000;
% p(1,2) = 3.4000;
% p(2,2) = -50.4000;
% p(1,3) = 4.2000;
% p(2,3) = -50.4000;
% p(1,4) = 4.2000;
% p(2,4) = -51.2000;
p(1,1) = 3.0000;
p(2,1) = -51.6000;
p(1,2) = 3.0000;
p(2,2) = -50.0000;
p(1,3) = 4.6000;
p(2,3) = -50.0000;
p(1,4) = 4.6000;
p(2,4) = -51.6000;
CSX = AddLinPoly( CSX, 'via4', 3, 'z', 4.8661, p, 0.5050 );

p = [];
p(1,1) = -4.6010;
p(2,1) = -150.8000;
p(1,2) = -4.6010;
p(2,2) = -67.6000;
p(1,3) = -64.4010;
p(2,3) = -67.6000;
p(1,4) = -64.4010;
p(2,4) = 64.4000;
p(1,5) = 64.4000;
p(2,5) = 64.4000;
p(1,6) = 64.4000;
p(2,6) = -64.4010;
p(1,7) = -61.2000;
p(2,7) = -64.4010;
p(1,8) = -61.2000;
p(2,8) = 61.2000;
p(1,9) = 61.2000;
p(2,9) = 61.2000;
p(1,10) = 61.2000;
p(2,10) = -61.2000;
p(1,11) = -58.0000;
p(2,11) = -61.2000;
p(1,12) = -58.0000;
p(2,12) = 58.0000;
p(1,13) = 58.0000;
p(2,13) = 58.0000;
p(1,14) = 58.0000;
p(2,14) = -58.0000;
p(1,15) = -54.8010;
p(2,15) = -58.0000;
p(1,16) = -54.8010;
p(2,16) = 54.8000;
p(1,17) = 54.8000;
p(2,17) = 54.8000;
p(1,18) = 54.8000;
p(2,18) = -54.8010;
p(1,19) = -51.6000;
p(2,19) = -54.8010;
p(1,20) = -51.6000;
p(2,20) = 51.6000;
p(1,21) = 51.6000;
p(2,21) = 51.6000;
p(1,22) = 51.6000;
p(2,22) = -51.6000;
p(1,23) = 3.8000;
p(2,23) = -51.6000;
p(1,24) = 3.8000;
p(2,24) = -50.0000;
p(1,25) = 50.0000;
p(2,25) = -50.0000;
p(1,26) = 50.0000;
p(2,26) = 50.0000;
p(1,27) = -50.0000;
p(2,27) = 50.0000;
p(1,28) = -50.0000;
p(2,28) = -53.2000;
p(1,29) = 53.2000;
p(2,29) = -53.2000;
p(1,30) = 53.2000;
p(2,30) = 53.2000;
p(1,31) = -53.2000;
p(2,31) = 53.2000;
p(1,32) = -53.2000;
p(2,32) = -56.4000;
p(1,33) = 56.4000;
p(2,33) = -56.4000;
p(1,34) = 56.4000;
p(2,34) = 56.4000;
p(1,35) = -56.4000;
p(2,35) = 56.4000;
p(1,36) = -56.4000;
p(2,36) = -59.6000;
p(1,37) = 59.6000;
p(2,37) = -59.6000;
p(1,38) = 59.6000;
p(2,38) = 59.6000;
p(1,39) = -59.6000;
p(2,39) = 59.6000;
p(1,40) = -59.6000;
p(2,40) = -62.8010;
p(1,41) = 62.8000;
p(2,41) = -62.8010;
p(1,42) = 62.8000;
p(2,42) = 62.8000;
p(1,43) = -62.8010;
p(2,43) = 62.8000;
p(1,44) = -62.8010;
p(2,44) = -66.0000;
p(1,45) = -3.0000;
p(2,45) = -66.0000;
p(1,46) = -3.0000;
p(2,46) = -150.8000;
CSX = AddLinPoly( CSX, 'metal5', 3, 'z', 5.3711, p, 1.2600 );

p = [];
p(1,1) = 3.0000;
p(2,1) = -51.6000;
p(1,2) = 3.0000;
p(2,2) = -50.0000;
p(1,3) = 4.6000;
p(2,3) = -50.0000;
p(1,4) = 4.6000;
p(2,4) = -51.6000;
CSX = AddLinPoly( CSX, 'metal5', 3, 'z', 5.3711, p, 1.2600 );

p = [];
p(1,1) = 3.0000;
p(2,1) = -51.6000;
p(1,2) = 3.0000;
p(2,2) = -50.0000;
p(1,3) = 4.6000;
p(2,3) = -50.0000;
p(1,4) = 4.6000;
p(2,4) = -51.6000;
CSX = AddLinPoly( CSX, 'metal4', 3, 'z', 4.0211, p, 0.8450 );

p = [];
p(1,1) = 3.0000;
p(2,1) = -150.8000;
p(1,2) = 3.0000;
p(2,2) = -51.6;
p(1,3) = 4.6000;
p(2,3) = -51.6;
p(1,4) = 4.6000;
p(2,4) = -150.8000;
CSX = AddLinPoly( CSX, 'metal4', 3, 'z', 4.0211, p, 0.8450 );

start = [ -3.8000 -150.0000 -400.0000 ];
stop  = [ -3.8000 -150.0000 5.3711 ];
[CSX, port{1}] = AddCurvePort( CSX, 9, 1, 50, start, stop, true );

start = [ +3.8000 -150.0000 -400.0000 ];
stop  = [ +3.8000 -150.0000 4.0211 ];
[CSX, port{2}] = AddCurvePort( CSX, 9, 2, 50, start, stop, false );
