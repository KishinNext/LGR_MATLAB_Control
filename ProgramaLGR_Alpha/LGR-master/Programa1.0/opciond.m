function [Pd,Gzcang]=opciond(planta,zita,ts,T)%Retorna el polo deseado y el angulo del controlador
Gc=planta;
wn=4/(zita*ts);%Frecuencia natural
Pd=exp(T*(-zita*wn+wn*sqrt(1-zita^2)*1i))%Se calcula el polo deseado
Gz=c2d(Gc,T,'zoh');%Sistema discreto
Gzang=angle(evalfr(Gz,Pd))*180/pi;%Angulo de la planta
Gzcang=wrapTo180(180-Gzang);%%Angulo del controlador
end