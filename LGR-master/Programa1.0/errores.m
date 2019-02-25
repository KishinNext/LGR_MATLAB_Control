function [k,e]=errores(controlador,Gd,T)%Retorna el polo deseado y el angulo del controlador
 z=tf('z',T);
% R=(z-1)/(z*T);
 R=(z-1)/(z*T);
 Ra=R^2;
 kp= evalfr(minreal(controlador*Gd),1);
 ep=1/(1+kp);
 kv= evalfr(minreal(controlador*Gd*R),1);
 ev=1/kv;
 ka= evalfr(minreal(controlador*Gd*Ra),1);
 ea=1/ka;
 k=[kp kv ka];
 e=[ep ev ea];
 
end