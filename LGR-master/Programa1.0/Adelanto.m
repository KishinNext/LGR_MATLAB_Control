function [num,den]=Adelanto(planta,MFd,T,opcion,Kv,Kp,Ka)
% 
% opcion=1;
% Kv=1;
% Kp=5;
% Ka=1;
% 
% T=0.1;
% MFd=60;
% dBr=12;
 O=5;
% planta=zpk([],[-1 -2],5);


%RECORDAR CAMBIAR EL NÚMERO DE INTEGRADORES
Gz=c2d(planta,T,'zoh');
Gw=d2c(Gz,'tustin');
s=tf('s');
P=pole(Gw);


integrador=0;
contador=1;
if opcion==1
    for k=1:length(P)
        if P(k)==0
            integrador=0;
            contador=contador+1;
        end
    end
    if contador>=2
        K=1;
    else
        if integrador~=1
            y=1-integrador;
            int=1/(s^(y+integrador));
            lim=evalfr(minreal(int*s^(1)*Gw),0);
            K=Kp/lim;   
        else
            int=1/(s^(1));
            lim=evalfr(minreal(int*s^1*Gw),0);
            K=Kp/lim; 
        end 
    end
elseif opcion==2
    for k=1:length(P)
        if P(k)==0
            integrador=0;
            contador=contador+1;
        end
    end
    if contador>=2
        K=1;
    else
        if integrador~=2
            y=2-integrador;
            int=1/(s^(y));
            lim=evalfr(minreal(int*s^(2)*Gw),0);
            K=Kv/lim;   
        else
            int=1/(s^(2));
            lim=evalfr(minreal(int*s^2*Gw),0);
            K=Kv/lim; 
            
        end
    end
elseif opcion==3
    for k=1:length(P)
        if P(k)==0
            integrador=integrador+1;
            contador=contador+1;
        end
    end
    if contador>=3
        K=1;
    else
        if integrador~=3
            y=3-integrador;
            int=1/(s^(y));
            lim=evalfr(minreal(int*s^(3)*Gw),0);
            K=Ka/lim;   
        else
            int=1/(s^(3));
            lim=evalfr(minreal(int*s^3*Gw),0);
            K=Ka/lim; 
        end
    end
else
    K=1;
end

if K==0
   Gw=Gw;
else
    Gw=Gw*K;
end



[~,Pm,~,~]=margin(Gw);
%disp("Diseño de controlador en adelando.")
for k=1:90
    MFr=Pm;
    phi=MFd-MFr+O;
    b=(1+sind(phi))/(1-sind(phi));
    cal=-10*log10(b); 
        if b>0 && (0<phi) && (phi<90)
            %disp("Diseñando...")
            w=1:0.0001:100;
%             figure
%             bode(Gw,w);
            [MAG,PHASE,X]=bode(Gw,w);
            Magnitud=reshape(MAG,[],1);
            MagnitudDB=20*log10(Magnitud);
            Phase=reshape(PHASE,[],1);
            frecuencia=reshape(X,[],1);
            [fi,~]=find(MagnitudDB>(cal-0.0004) & MagnitudDB<(cal+0.0004));
            try
                phi2=MFr-Phase(fi(1)); %PREGUNTAR
            catch
                %disp("Los rasgos del sistema no cumplen")    
            end
            if (phi2)<O 
                
                T2=1/(frecuencia(fi(1))*sqrt(b));
                Cw=tf([b*T2 1],[T2 1]);
                
                [~,Pm,~,~]=margin(Gw*Cw);
                if Pm<MFd 
                    O=O+1;
                else
                    %disp("Diseño Finalizado.")
%                     figure
%                     margin(Gw*Cw)
                    break;
                end
            else
                %disp("Se necesita modificar theta, se diseña nuevamente...")
                O = O+1;
            end
        else
           %disp("Diseño fallido, no es posible cumplir los requerimientos")
           return;
        end
end

Controlador=c2d(Cw,T,'tustin');
[num,den]=tfdata(Controlador,'v');  
end   

