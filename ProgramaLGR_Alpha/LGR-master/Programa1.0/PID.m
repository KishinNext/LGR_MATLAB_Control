function [controlador]=PID(Pd,angulo,T,planta)
Gc=planta;
Gz=c2d(Gc,T);
cerosang=(angulo+(angle(Pd*(Pd-1))*180/pi))/2;
ceros=real(Pd)-(imag(Pd)/tan(cerosang*pi/180));
K=1/abs(evalfr(Gz,Pd)*((Pd-ceros)*(Pd-ceros))/(Pd*(Pd-1)));
controlador=zpk([ceros ceros],[0 1],K,T);    
end