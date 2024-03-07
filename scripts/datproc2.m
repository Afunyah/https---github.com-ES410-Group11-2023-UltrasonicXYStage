dat = load("batch01_secondscan.csv");
% dat = load("batch01_firstscan.csv");

yindex = dat(:,1);
xindex = dat(:,2);

phs = dat(:,5);
ampl = dat(:,6);
% 
figure;
histogram(phs,10);
title("Phase");

figure;
histogram(ampl,10);
title("Amplitude");


inds = 1:100;

ind_phs = [inds' phs];
ind_ampl = [inds' ampl];

figure;
scatter(ind_phs(:,1),ind_phs(:,2));
grid on;
title("Phase");

figure;
scatter(ind_ampl(:,1),ind_ampl(:,2));
grid on;
title("Amplitude");

match_dat = {};
for i=1:length(ind_phs)
    c = 1;
    for j=1:length(ind_phs)
        indist_phs = abs(ind_phs(i,2)-ind_phs(j,2));
        indist_ampl = abs(ind_ampl(i,2)-ind_ampl(j,2));
        if(indist_phs<=20 && indist_ampl<=3 && i~=j)
            match_dat{i,c} = j;
            c = c+1;
        end
    end
end

phases = -180:180;
more_match_dat = {};
for i=1:length(phases)
    c = 1;
    for j=1:length(ind_phs)
        indist_phs = abs(phases(i)-ind_phs(j,2));
        indist_ampl = abs(9-ind_ampl(j,2));
        if(indist_phs<=20 && indist_ampl<=3)
            more_match_dat{i,c} = j;
            c = c+1;
        end
    end
end

histdat=zeros(size(more_match_dat));


