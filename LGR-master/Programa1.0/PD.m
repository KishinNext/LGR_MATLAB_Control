function [Controlador]=PD(Pd,angulo,T,planta)
    Angulonum=angulo+(angle(Pd)*180/pi);
    Valora=real(Pd)-((imag(Pd))/tand(Angulonum));
    Gz=c2d(planta,T);
    k=1/abs(((Pd-Valora)/Pd)*evalfr(Gz,Pd));
    Controlador=zpk(Valora,0,k,T);
end