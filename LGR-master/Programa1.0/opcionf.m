function [Pd,Gzcang]=opcionf(planta,Mp,n,T)%Retorna el polo deseado y el angulo del controlador
Gc=planta;
zita=abs(log(Mp))/(sqrt((pi^2)+log(Mp)^2));%Se halla el valor minimo de Zita
zitaf=(1+zita)/2;%Se halla un valor intermedio entre zita y el maximo que es 1
wd=(2*pi)/(n*T);
wn=wd/sqrt(1-zitaf^2);%Frecuencia natural
Pd=exp(T*((-zita*wn)+(wn*sqrt(1-zita^2)*1i)));%Se calcula el polo deseado
Gz=c2d(Gc,T);%Sistema discreto
Gzang=angle(evalfr(Gz,Pd))*180/pi;%Angulo de la planta
Gzcang=wrapTo180(180-Gzang);%%Angulo del controlador
end