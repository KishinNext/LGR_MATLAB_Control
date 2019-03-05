function [Polo,Angulo]=opcionc(planta,Periodo,ts,mp)

zita=abs(log(mp))/sqrt(pi^2+(log(mp))^2);
wn=4/(zita*ts);
Polo=exp(Periodo*(-zita*wn+1i*wn*sqrt(1-zita^2)));
PlantaDiscreta=c2d(planta,Periodo,'zoh');
GAngulo=angle(evalfr(PlantaDiscreta,Polo))*180/pi;
Angulo=wrapTo180(180-GAngulo);
end