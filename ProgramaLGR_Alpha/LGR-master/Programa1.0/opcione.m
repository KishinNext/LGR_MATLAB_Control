function [Polo,Angulo]=opcione(planta,T,ts,n)
wd=2*pi/n*T;
zita=4/(ts*sqrt(wd^2+(16/ts^2)));
%wn=abs(sqrt((2*pi/T*n)^2+(16/ts^2)))

%zita=4/(wn*ts)

wn=4/(zita*ts);
%Polo=exp(T*(-zita*wn+1i*wn*sqrt(1-zita^2)));
Polo=exp(T*(-zita*wn+wn*sqrt(1-zita^2)*1i));
PlantaDiscreta=c2d(planta,T,'zoh');
GAngulo=angle(evalfr(PlantaDiscreta,Polo))*180/pi;
Angulo=wrapTo180(180-GAngulo);
end