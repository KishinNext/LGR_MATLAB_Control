function [Compensador]=Compensador(a,T)
    %Gz=c2d(planta,T,'zoh');
    %k=1/abs(((Pd-a)/(Pd-0.9999))*evalfr(Gz,Pd));
    Compensador=zpk([a],[0.9999],1,T);
end