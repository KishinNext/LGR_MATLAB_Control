function [controlador]=PI(Pd,angulo,T,planta,opcion)
if opcion==1
Gc=planta;
Gz=c2d(Gc,T);
ceroang=angulo+(angle(Pd-1)*180/pi);
cero=real(Pd)-(imag(Pd)/tand(ceroang));
K=1/abs(evalfr(Gz,Pd)*(Pd-cero)/(Pd-1));

controlador=zpk(cero,1,K,T); 
end
if opcion==2%Para correcion

ceroang=angulo+(angle(Pd-1)*180/pi);
cero=real(Pd)-(imag(Pd)/tan(ceroang*pi/180));
K=1/abs(evalfr(planta,Pd)*(Pd-cero)/(Pd-1));
controlador=zpk(cero,1,1,T); 
end
end