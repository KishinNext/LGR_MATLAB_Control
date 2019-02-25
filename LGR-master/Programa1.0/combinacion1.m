function [Cz]=combinacion1(planta,MFd,dBr,wg,T,opcion,Kv,Kp,Ka)

% opcion=1;
% Kv=1;
% Kp=0;
% Ka=1;
% 
% T=0.1;
% MFd=55;
% dBr=6;
% wg=0.2;
% 
% planta=zpk([],[0 -0.225 -3.9997 -179.3],300);
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
w=0:0.0001:100;
[MAG,PHASE,X]=bode(Gw,w);
Magnitud=reshape(MAG,[],1);
MagnitudDB=20*log10(Magnitud);
Phase=reshape(PHASE,[],1);
frecuencia=reshape(X,[],1);
[fi,~]=find(frecuencia>(Wcp-0.0005) & frecuencia<(Wcp+0.0005));
Phi=Phase(fi(1))-180;
Phi_max=MFd-Phi+6;
Mag=MagnitudDB(fi(1));
b=(1+sind(Phi_max))/(1-sind(Phi_max));
Alpha=-10*log(b)-Mag;
a=10^(Alpha/20);
T1=10/(a*wg);
T2=1/(sqrt(b)*wg);
C1=tf([b*T2 1],[T2 1]);
C2=tf([a*T1 1],[T1 1]);
Cw=C2*C1;
Cz=c2d(Cw,T,'tustin');

end

   