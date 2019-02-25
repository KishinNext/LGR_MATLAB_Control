function [num,den,Gw,Cw]=Atraso(planta,MFd,dBr,Wg,T,opcion,Kv,Kp,Ka)

%DISEÑO ADELANTO

% opcion=2;
% Kv=5;
% Kp=1;
% Ka=5;
% 
% T=0.1;
% MFd=55;
% dBr=6;
% O=5;
% 
% planta=zpk([],[-1 -2],5);
%RECORDAR CAMBIAR EL NÚMERO DE INTEGRADORES
Gz=c2d(planta,T,'zoh');
Gw=d2c(Gz,'tustin');
s=tf('s');
P=pole(Gw);
integrador=0;
contador=1;
if opcion==1
    for k=1:length(P)
        if P(k)==0
            integrador=0;
            contador=contador+1;
        end
    end
    if contador>=2
        K=1;
    else
        if integrador~=1
            y=1-integrador;
            int=1/(s^(y+integrador));
            lim=evalfr(minreal(int*s^(1)*Gw),0);
            K=Kp/lim;   
        else
            int=1/(s^(1));
            lim=evalfr(minreal(int*s^1*Gw),0);
            K=Kp/lim; 
        end 
    end
elseif opcion==2
    for k=1:length(P)
        if P(k)==0
            integrador=0;
            contador=contador+1;
        end
    end
    if contador>=2
        K=1;
    else
        if integrador~=2
            y=2-integrador;
            int=1/(s^(y));
            lim=evalfr(minreal(int*s^(2)*Gw),0);
            K=Kv/lim;   
        else
            int=1/(s^(2));
            lim=evalfr(minreal(int*s^2*Gw),0);
            K=Kv/lim; 
            
        end
    end
elseif opcion==3
    for k=1:length(P)
        if P(k)==0
            integrador=integrador+1;
            contador=contador+1;
        end
    end
    if contador>=3
        K=1;
    else
        if integrador~=3
            y=3-integrador;
            int=1/(s^(y));
            lim=evalfr(minreal(int*s^(3)*Gw),0);
            K=Ka/lim;   
        else
            int=1/(s^(3));
            lim=evalfr(minreal(int*s^3*Gw),0);
            K=Ka/lim; 
        end
    end
else
    K=1;
end

if K==0
  Gw=Gw;
else
    Gw=Gw*K;
end


[Gm,Pm,Wcg,Wcp]=margin(Gw);
Gm_DB=20*log10(Gm);
%DISEÑO ATRASO
w=1:0.0001:1000;
[MAGa,PHASEa,Xa]=bode(Gw,w);
Magnituda=reshape(MAGa,[],1);
MagnitudDBa=20*log10(Magnituda);
Phasea=reshape(PHASEa,[],1);
frecuenciaa=reshape(Xa,[],1);
cala=0;
%disp("Diseñando...")
for k=1:10000
    [fia,~]=find(MagnitudDBa>(cala-0.05) & MagnitudDBa<(cala+0.05));
    phasemodificada=Phasea(fia(1));
    MFd2=phasemodificada;
    MF=MFd2+6-180;
    MF=360+MF;
    wg=frecuenciaa(fia(1));
    mg=MagnitudDBa(fia(1));
    a=10^-(mg/20);
    T1=10/(a*wg);
    Cw=tf([a*T1 1],[T1 1]);
    [Gma2,Pma2,Wcga2,Wcpa2]=margin(Gw*Cw);
    Gma_dB2 = 20*log10(Gma2);
        if (Pma2<(MFd+0.05)) && (Pma2>(MFd-0.05))
            disp("Diseño exitóso.")
            break;
        else 
            disp("Realizando modificaciones... moviendo fase.")
            if Pma2<MFd
                cala=cala+0.01;
                
            else
                cala=cala-0.01;
            end
            disp(phasemodificada)
        end
end

Cz=c2d(Cw,T,'tustin');
[num,den]=tfdata(Cz,'v');
disp("El programa há finalizado.")
end
