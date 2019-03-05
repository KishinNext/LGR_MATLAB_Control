function [k]=errores(controlador,Gd,T)%Retorna el polo deseado y el angulo del controlador
    z=tf('z',T);
% R=(z-1)/(z*T);
 R=(z-1)/(z*T);
 Ra=R^2;
 minreal(minreal(controlador*Gd*R))
 kv= evalfr(minreal(controlador*Gd*R),1)
 ka= evalfr(minreal(controlador*Gd*Ra),1)
 k=[kv ka];
 
end