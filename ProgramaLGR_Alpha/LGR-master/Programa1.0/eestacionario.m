function [a,controlador2]=eestacionario(opcion,e,controlador,Gd,T,Pd,ang)
%s=tf('s');
Gc=controlador*Gd;
disp(e);
 z=tf('z',T);
 R=(z-1)/(z*T);
if opcion==1 %Error posicion constante
      kp=(1-e)/e
      den=1-0.9999;
      lim=evalfr(minreal(Gd*controlador),1);
      
      f=(kp*den)/lim
      a=1-f;
      disp(a);
      [controlador2]=Compensador(a,T);

end
if opcion==2 %Error de posicion es a 0, probando PI
 %controlador2=PI(0.0001+0.0001*1i,0.001,T,Gc,2);
 controlador2=PI(0.9999,0.00001,T,Gc,2);
 a=0;
end
if opcion==3%Error de velocidad constant
    
%     num=evalfr(minreal((e*Gc*(z^2-z)-((z-0.9999)*(z*T)))),1);
%     dem=evalfr(minreal((e*Gc*(z-1))),1);
      kv=1/e;
      den=1-0.9999;
      lim=evalfr(minreal(Gd*controlador*R),1);
      disp(lim)
      f=(kv*den)/lim
        a=1-f;

      [controlador2]=Compensador(a,T);
    
end
if opcion==4 %Velocidad=0;
 controlador2=PI(0.9999,0.00001,T,Gc,2);
 controlador2=controlador2*controlador2;
 a=0;
end
if opcion==5
%     num=evalfr(minreal(((e*Gc*(z-1)*(z-1)*z)-((z-0.9999)*(z*z*T*T)))),1);
%     dem=evalfr(minreal((e*Gc*(z-1)*(z-1))),1);
%     a=num/dem;
%     disp(a);
%     [controlador2]=Compensador(a,T);
%     disp(controlador2);
      kv=1/e;
      den=1-0.9999;
      lim=evalfr(minreal(Gd*controlador*R^2),1);
      disp(lim)
      f=(kv*den)/lim
      a=1-f;

      [controlador2]=Compensador(a,T);
    
end
if opcion==6
 controlador2=PI(0.9999,0.00001,T,Gc,2);
 controlador2=controlador2*controlador2*controlador2;
 a=0;
end

end