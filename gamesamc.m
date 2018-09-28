% monte carlo integration r.e.s. project
clear
close all

n = 1000; %<<more samples better sim>>
% n = 10^6; %<<more samples better sim>>
k = 1.5;  % peiramatisteite wste na vgenei logiko to CF
% k apo 1.5 ews 3 polu xondrika kai CF ~ 0.2,0.3 klp
vav = 11; % mesh taxythta anemou 
vr=11; %onomastikh taxythta sthn opoia paragetai h P rated
% gia thn onomastikh taxythta des diagramma P(wind speed) toy 
% antistoixou fylladiou
for j=3:25
vav=j;
summary=0;
% rand(n,1)
% unifrnd(0, 1, n, 1)

for i=1:n
u = rand; %sample apo omoiomorfh katanomh
v = 3+(25-3)*u; %m.c. inverse transform
if vav>=3; 
if v<vr
f = (k/(1.12*vav))*((v/(1.12*vav))^(k-1))*exp(-(v/(1.12*vav))^k);%weibull
% com : y=f*P(hl)
y = f*(2*10^6)*((v^2-3^2)/((vr^2)-(3^2))); %analoga me ta specs ths tourbinas
summary=summary+y;

elseif v<=25
f = (k/(1.12*vav))*((v/(1.12*vav))^(k-1))*exp(-(v/(1.12*vav))^k);%weibull
y = f*(2*10^6); %analoga me ta specs ths tourbinas 2MW RATED POWER
summary=summary+y;

else
    summary=0;
end

else
    summary=0;
end
end

int = (25-3)*summary/n ; % h mesh isxys se kilowatt
finaly(j)=int;  %pinakes gia plottarisma
finalx(j)=j;
end
plot (finalx,finaly)
%vavmax=13m/s apo to plot
int=finaly(13)
Vav=finalx(13)
cf= int/(2*10^6) %capacity factor
Eav= int*8640/1000 %kilovatores enos etous

%ta noumera den periexoun apwleies mhxanikes trivwn atraktou kai alles apwleies
% opote mhn agxwtheite an vgenei to CF ligo megalytero.
% shmasia exei h taksh megethous


% end of program
