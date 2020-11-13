function CSX = create_sky130_geometry ( CSX , x_min, x_max, y_min, y_max, unit )

CSX = AddMaterial( CSX, 'PI1' );
CSX = SetMaterialProperty( CSX, 'PI1', 'Epsilon', 2.94 );

CSX = AddMaterial( CSX, 'TOPNIT' );
CSX = SetMaterialProperty( CSX, 'TOPNIT', 'Epsilon', 7.5 );

CSX = AddMaterial( CSX, 'NILD6' );
CSX = SetMaterialProperty( CSX, 'NILD6', 'Epsilon', 4 );

CSX = AddMaterial( CSX, 'NILD5' );
CSX = SetMaterialProperty( CSX, 'NILD5', 'Epsilon', 4.1 );

CSX = AddMaterial( CSX, 'NILD4' );
CSX = SetMaterialProperty( CSX, 'NILD4', 'Epsilon', 4.2 );

CSX = AddMaterial( CSX, 'NILD3' );
CSX = SetMaterialProperty( CSX, 'NILD3', 'Epsilon', 4.5 );

CSX = AddMaterial( CSX, 'NILD2' );
CSX = SetMaterialProperty( CSX, 'NILD2', 'Epsilon', 4.05 );

CSX = AddMaterial( CSX, 'LINT' );
CSX = SetMaterialProperty( CSX, 'LINT', 'Epsilon', 7.3 );

CSX = AddMaterial( CSX, 'PSG' );
CSX = SetMaterialProperty( CSX, 'PSG', 'Epsilon', 3.9 );

CSX = AddMaterial( CSX, 'FOX' );
CSX = SetMaterialProperty( CSX, 'FOX', 'Epsilon', 3.9 );

CSX = AddMaterial( CSX, 'substr' );
CSX = SetMaterialProperty( CSX, 'substr', 'Kappa', 1.5e4 );

% CSX = AddMaterial( CSX, 'nwell' );
% CSX = SetMaterialProperty( CSX, 'nwell', 'Kappa', 2.450980e+03 );

% CSX = AddMaterial( CSX, 'diff' );
% CSX = SetMaterialProperty( CSX, 'diff', 'Kappa', 2.628812e+04 );

% CSX = AddMaterial( CSX, 'poly' );
CSX = SetMaterialProperty( CSX, 'poly', 'Kappa', 1.152605e+05 );

CSX = AddMaterial( CSX, 'licon' );
CSX = SetMaterialProperty( CSX, 'licon', 'Kappa', 0.9361e-6 / (152 * 0.17e-6 * 0.17e-6) );

CSX = AddMaterial( CSX, 'li' );
CSX = SetMaterialProperty( CSX, 'li', 'Kappa', 7.812500e+05 );

CSX = AddMaterial( CSX, 'mcon' );
CSX = SetMaterialProperty( CSX, 'mcon', 'Kappa', 0.34e-6 / (9.3 * 0.17e-6 * 0.17e-6) );

CSX = AddMaterial( CSX, 'metal1' );
CSX = SetMaterialProperty( CSX, 'metal1', 'Kappa', 2.222222e+07 );

CSX = AddMaterial( CSX, 'via1' );
CSX = SetMaterialProperty( CSX, 'via1', 'Kappa', 0.27e-6 / (4.5 * 0.15e-6 * 0.15e-6) );

CSX = AddMaterial( CSX, 'metal2' );
CSX = SetMaterialProperty( CSX, 'metal2', 'Kappa', 2.222222e+07 );

CSX = AddMaterial( CSX, 'via2' );
CSX = SetMaterialProperty( CSX, 'via2', 'Kappa', 0.42e-6 / (3.41 * 0.2e-6 * 0.2e-6) );

CSX = AddMaterial( CSX, 'metal3' );
CSX = SetMaterialProperty( CSX, 'metal3', 'Kappa', 2.517940e+07 );

CSX = AddMaterial( CSX, 'via3' );
CSX = SetMaterialProperty( CSX, 'via3', 'Kappa', 0.39e-6 / (3.41 * 0.2e-6 * 0.2e-6) );

CSX = AddMaterial( CSX, 'metal4' );
CSX = SetMaterialProperty( CSX, 'metal4', 'Kappa', 2.517940e+07 );

CSX = AddMaterial( CSX, 'via4' );
CSX = SetMaterialProperty( CSX, 'via4', 'Kappa', 0.505e-6 / (0.38 * 0.8e-6 * 0.8e-6) );

CSX = AddMaterial( CSX, 'metal5' );
CSX = SetMaterialProperty( CSX, 'metal5', 'Kappa', 2.784740e+07 );

CSX = AddBox( CSX, 'PI1',    0, [x_min y_min  5.7488], [x_max y_max 11.8834] );
CSX = AddBox( CSX, 'TOPNIT', 0, [x_min y_min  5.3711], [x_max y_max  5.7488] );
CSX = AddBox( CSX, 'NILD6',  0, [x_min y_min  4.0211], [x_max y_max  5.3711] );
CSX = AddBox( CSX, 'NILD5',  0, [x_min y_min  2.7861], [x_max y_max  4.0211] );
CSX = AddBox( CSX, 'NILD4',  0, [x_min y_min  2.0061], [x_max y_max  2.7861] );
CSX = AddBox( CSX, 'NILD3',  0, [x_min y_min  1.3761], [x_max y_max  2.0061] );
CSX = AddBox( CSX, 'NILD2',  0, [x_min y_min  1.0111], [x_max y_max  1.3761] );
CSX = AddBox( CSX, 'LINT',   0, [x_min y_min  0.9361], [x_max y_max  1.0111] );
CSX = AddBox( CSX, 'PSG',    0, [x_min y_min  0.3262], [x_max y_max  0.9361] );
CSX = AddBox( CSX, 'FOX',    0, [x_min y_min  0.0000], [x_max y_max  0.3262] );
CSX = AddBox( CSX, 'substr', 0, [x_min y_min -1.0000], [x_max y_max  0.0000] );
