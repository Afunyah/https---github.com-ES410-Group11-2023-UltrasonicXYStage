dat = load("batch01_firstscan.csv");
yindex = dat(:,1);
xindex = dat(:,2);

phs = dat(:,5);
ampl = dat(:,6);

figure;
histogram(phs,10);
title("Phase");

figure;
histogram(ampl,10);
title("Amplitude");


