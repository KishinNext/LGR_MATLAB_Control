function [periodo]=periodoopciones(Mp,ts,zita,wn,n,G)%Retorna el polo deseado y el angulo del controlador
 if (zita~=0)&&(wn~=0)
     planta=tf(wn^2,[1 (2*zita*wn) wn^2]);
     datos = stepinfo(planta,'RiseTimeLimits',[0.05 0.95]);
     periodomin=datos.RiseTime/12;
     periodomax=datos.RiseTime/8;
     periodo=(periodomin+periodomax)/2;
 end
  if (ts~=0)&&(Mp~=0)
      zita=abs(log(Mp))/(sqrt((pi^2)+log(Mp)^2));%Se halla el valor minimo de Zita
      wn=4/(zita*ts);%Frecuencia natural
      planta=tf(wn^2,[1 (2*zita*wn) wn^2]);
      datos = stepinfo(planta,'RiseTimeLimits',[0.05 0.95]);
      periodomin=datos.RiseTime/12;
      periodomax=datos.RiseTime/8;
      periodo=(periodomin+periodomax)/2;
  end
  
    if (ts~=0)&&(zita~=0)
     wn=4/(zita*ts);%Frecuencia natural
     planta=tf(wn^2,[1 (2*zita*wn) wn^2]);
     datos = stepinfo(planta,'RiseTimeLimits',[0.05 0.95]);
      periodomin=datos.RiseTime/12;
      periodomax=datos.RiseTime/8;
      periodo=(periodomin+periodomax)/2;
    end
    if n==1
        Gf=feedback(G,1);
        datos = stepinfo(Gf,'RiseTimeLimits',[0.05 0.95]);
        retardo=G.OutputDelay;
        if retardo==0
       periodomin=datos.RiseTime/12;
       periodomax=datos.RiseTime/8;
      periodo=(periodomin+periodomax)/2;
         else 
        periodo=retardo/3;
   
        end
        
    end    
end