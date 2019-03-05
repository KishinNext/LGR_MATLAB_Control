function [K,int,Gw,Cw]=combinacion1(planta,MFd,dBr,wg,T,opcion,Kv,Kp,Ka)
clc
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
contador=0;
int=1;
if opcion==1
    for k=1:length(P)
        if P(k)==0
            contador=contador+1;           
        end
    end
    if contador>=1
        %DESACTIVAR ERROR DE POSICIÓN Y COLOCAR EP=0
    else
            lim=evalfr(minreal(Gw),0);
            K=Kp/lim; 
            limitep=evalfr(minreal(K*Gw),0);
    end
elseif opcion==2
    for k=1:length(P)
        if P(k)==0
            contador=contador+1;
        end
    end
    if contador==0
            y=1;
            int=1/(s^(y));
            lim=evalfr(minreal(int*s*Gw),0);
            K=Kv/lim; 
            limitev=evalfr(minreal(K*int*s*Gw),0);
        %DESACTIVAR ERROR DE POSICIÓN Y COLOCAR EP=0
    elseif contador==1
        %DESACTIVAR ERROR DE POSICIÓN Y COLOCAR EP=0
            lim=evalfr(minreal(s*Gw),0);
            K=Kv/lim;   
            limitev=evalfr(minreal(K*s*Gw),0);
    elseif contador>=2
            %DESACTIVAR ERROR DE POSICIÓN Y ACELERACIÓN COLOCAR EP,EV=0    
    end
elseif opcion==3
    for k=1:length(P)
        if P(k)==0
            integrador=integrador+1;
            contador=contador+1;
        end
    end
    
    if contador==0
            y=2;
            int=1/(s^(y));
            lim=evalfr(minreal(int*s^2*Gw),0);
            K=Ka/lim; 
            limitea=evalfr(minreal(K*int*s^2*Gw),0);
        %DESACTIVAR ERROR DE POSICIÓN Y ACELERACIÓN COLOCAR EP,EV=0  
    elseif contador==1
            y=1;
            int=1/(s^(y));
            lim=evalfr(minreal(int*s^2*Gw),0);
            K=Ka/lim; 
            limitea=evalfr(minreal(K*int*s^2*Gw),0);
        %DESACTIVAR ERROR DE POSICIÓN Y ACELERACIÓN COLOCAR EP,EV=0 
    elseif contador==2
            lim=evalfr(minreal(s^2*Gw),0);
            K=Ka/lim; 
            limitea=evalfr(minreal(K*s^2*Gw),0);
        %DESACTIVAR ERROR DE POSICIÓN Y ACELERACIÓN COLOCAR EP,EV=0 
    elseif contador>2
       %DESACTIVAR todos los errores
    end
else
    K=1;
end

if K==0
   Gw=Gw*int;
else
    Gw=Gw*K*int;
end

    

[Gm,Pm,Wcg,Wcp]=margin(Gw);
w=0.0001:0.0001:100;
[MAG,PHASE,X]=bode(Gw,w);
Magnitud=reshape(MAG,[],1);
MagnitudDB=20*log10(Magnitud);
Phase=reshape(PHASE,[],1);
frecuencia=reshape(X,[],1);
[fi,~]=find(frecuencia>(Wcp-0.05) & frecuencia<(Wcp+0.05));
Phi=Phase(fi(1))-180;
Phi_max=MFd-Phi+6;
Mag=MagnitudDB(fi(1));
b=(1+sind(Phi_max))/(1-sind(Phi_max));
Alpha=-10*log(b)-Mag;
a=10^(Alpha/20);
T1=10/(a*wg)
T2=1/(sqrt(b)*wg)
C1=tf([b*T2 1],[T2 1]);
C2=tf([a*T1 1],[T1 1]);
Cw=C2*C1*int;
Cz=c2d(Cw,T,'tustin');

end

   