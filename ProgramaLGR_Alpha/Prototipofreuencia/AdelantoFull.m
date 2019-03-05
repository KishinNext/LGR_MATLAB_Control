clc
clearvars;
close all;
format short;
%DISEÑO ADELANTO
%Parámetros
%parametros ejercicio
T=0.1;
Kv=5;
MFd=60;
O=30;
planta=zpk([],[-1 -2],5);

% T=0.1;
% Kv=20;
% MFd=50;
% O=30;
% planta=zpk([],[0 -0.5],1);

Gz=c2d(planta,T,'zoh');
Gw=d2c(Gz,'tustin');
s=tf('s');
int=1/s;
intd=c2d(int,T,'tustin');
lim=evalfr(minreal(int*s*Gw),0);
K=Kv/lim;
Gw=Gw*K;
margin(int*Gw);


[Gm,Pm,Wcg,Wcp]=margin(Gw);


MFr=Pm;
phi=MFd-MFr+O;
b=(1+sind(phi))/(1-sind(phi));
cal=-10*log10(b);
if b>0 && (0<phi) && (phi<90)
    w=1:0.0001:1000;
    figure
    bode(Gw,w);
    [MAG,PHASE,X]=bode(Gw,w);
    Magnitud=reshape(MAG,[],1);
    MagnitudDB=20*log10(Magnitud);
    Phase=reshape(PHASE,[],1);
    frecuencia=reshape(X,[],1);
    [fi,~]=find(MagnitudDB>(cal-0.0004) & MagnitudDB<(cal+0.0004));
    phi2=MFr-Phase(fi(1));
    if (phi2)<O
        disp("Diseño exitoso")
        T2=1/(frecuencia(fi(1))*sqrt(b));
        Cw=tf([b*T2 1],[T2 1]);
        Cz=c2d(Cw,T,'tustin');
        margin(Gw*Cw)
    else
        disp("Comenzar again")
    end
else
    disp("Falló")
end


%%
%DISEÑO ADELANTO
Gwa=Cw*Gw;
[Gma,Pma,Wcga,Wcpa]=margin(Gwa);
wa=1:0.0001:1000;
%figure
%bode(Gwa,wa);
[MAGa,PHASEa,Xa]=bode(Gwa,wa);
Magnituda=reshape(MAGa,[],1);
MagnitudDBa=20*log10(Magnituda);
Phasea=reshape(PHASEa,[],1);
frecuenciaa=reshape(Xa,[],1);
cala=-1.505;
[fia,~]=find(MagnitudDBa>(cala-0.0004) & MagnitudDBa<(cala+0.0004));
phasemodificada=Phasea(fia(1));
%%
MFd=phasemodificada;
MF=MFd+6-180;
MF=360+MF;
wg=frecuenciaa(fia(1));
mg=MagnitudDBa(fia(1));

a=10^-(mg/20);
T1=10/(a*wg);
catraso=tf([a*T1 1],[T1 1]);
figure
margin(Gwa*catraso);


