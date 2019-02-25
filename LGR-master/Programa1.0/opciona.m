function [Polo,Angulo]=opciona(planta,Periodo,zita,wn)
Polo=exp(Periodo*(-zita*wn+1i*wn*sqrt(1-zita^2)));
PlantaDiscreta=c2d(planta,Periodo,'zoh');
GAngulo=angle(evalfr(PlantaDiscreta,Polo))*180/pi;
Angulo=wrapTo180(180-GAngulo);
end