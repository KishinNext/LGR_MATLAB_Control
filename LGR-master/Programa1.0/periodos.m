
function [retardo,periodo]=periodos(planta)
datos = stepinfo(planta,'RiseTimeLimits',[0.05 0.95]);
retardo=planta.OutputDelay;
if retardo==0
   periodomin=datos.RiseTime/12;
   periodomax=datos.RiseTime/8;
   periodo=(periodomin+periodomax)/2;
else
    periodo=retardo/2;
end
end
