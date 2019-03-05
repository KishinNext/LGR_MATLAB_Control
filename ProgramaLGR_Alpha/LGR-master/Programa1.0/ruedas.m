function [K,int,Gw,Cw,limitep,limitev,limitea]=ruedas(planta,MFd,T,opcion,Kv,Kp,Ka)
O=5;
limitep=0;
limitev=0;
limitea=0;
K=0;
int=0;

%RECORDAR CAMBIAR EL NÚMERO DE INTEGRADORES
Gz=c2d(planta,T,'zoh');
Gw=d2c(Gz,'tustin');
s=tf('s');
P=pole(Gw);

integrador=0;
contador=0;
int=1;
if opcion==1
    for k=1:length(P)
        if P(k)==0
            contador=contador+1;
        end
    end
    if contador>=1
        %DESACTIVAR ERROR DE POSICIÓN Y COLOCAR EP=0
    else
        lim=evalfr(minreal(Gw),0);
        K=Kp/lim;
        disp("ESTE ES")
        disp(K)
        limitep=evalfr(minreal(K*Gw),0);
    end
elseif opcion==2
    for k=1:length(P)
        if P(k)==0
            contador=contador+1;
        end
    end
    if contador==0
        y=1;
        int=1/(s^(y));
        
        lim=evalfr(minreal(int*s*Gw),0);
        K=Kv/lim;
        disp("ESTE ES Kv")
        disp(K)
        limitev=evalfr(minreal(K*int*s*Gw),0);
        %DESACTIVAR ERROR DE POSICIÓN Y COLOCAR EP=0
    elseif contador==1
        %DESACTIVAR ERROR DE POSICIÓN Y COLOCAR EP=0
        lim=evalfr(minreal(s*Gw),0);
        K=Kv/lim;
        limitev=evalfr(minreal(K*s*Gw),0);
    elseif contador>=2
        %DESACTIVAR ERROR DE POSICIÓN Y ACELERACIÓN COLOCAR EP,EV=0
    end
elseif opcion==3
    for k=1:length(P)
        if P(k)==0
            integrador=integrador+1;
            contador=contador+1;
        end
    end
    
    if contador==0
        y=2;
        int=1/(s^(y));
        lim=evalfr(minreal(int*s^2*Gw),0);
        K=Ka/lim;
        limitea=evalfr(minreal(K*int*s^2*Gw),0);
        %DESACTIVAR ERROR DE POSICIÓN Y ACELERACIÓN COLOCAR EP,EV=0
    elseif contador==1
        y=1;
        int=1/(s^(y));
        lim=evalfr(minreal(int*s^2*Gw),0);
        K=Ka/lim;
        limitea=evalfr(minreal(K*int*s^2*Gw),0);
        %DESACTIVAR ERROR DE POSICIÓN Y ACELERACIÓN COLOCAR EP,EV=0
    elseif contador==2
        lim=evalfr(minreal(s^2*Gw),0);
        K=Ka/lim;
        limitea=evalfr(minreal(K*s^2*Gw),0);
        %DESACTIVAR ERROR DE POSICIÓN Y ACELERACIÓN COLOCAR EP,EV=0
    elseif contador>2
        %DESACTIVAR todos los errores
    end
else
    K=1;
end

% if K==0
%     Gw=Gw*int;
% else
%     Gw=Gw*K*int;
%     
% end


[~,Pm,~,~]=margin(Gw);

%disp("Diseño de controlador en adelando.")
for k=1:1
    
    MFr=Pm;
    phi=MFd-MFr+O;
    b=(1+sind(phi))/(1-sind(phi));
    cal=-10*log10(b);
    if b>0 && (0<phi) && (phi<90)
        disp("Diseñando...")
        w=0.0001:0.0001:100;
        %             figure
        %             bode(Gw,w);
        [MAG,PHASE,X]=bode(Gw,w);
        Magnitud=reshape(MAG,[],1);
        MagnitudDB=20*log10(Magnitud);
        Phase=reshape(PHASE,[],1);
        frecuencia=reshape(X,[],1);
        [fi,~]=find(MagnitudDB>(cal-0.01) & MagnitudDB<(cal+0.01));
        %[fi2,~]=find(MagnitudDB>(dBr-0.01) & MagnitudDB<(dBr+0.01))
        phi=MFr-Phase(fi(1)); %PREGUNTAR
        if (phi)<O
            
            T2=1/(frecuencia(fi(1))*sqrt(b));
            Cw1=tf([b*T2 1],[T2 1]);
            Controlador=c2d(Cw1,T,'tustin');
            [~,Pm,~,~]=margin(Gw*Cw1);
            if Pm<MFd
                O=O+1;
            else
                disp("Diseño Finalizado.")
                %                     figure
                %                     margin(Gw*Cw)
                break;
            end
        else
            disp("Se necesita modificar theta, se diseña nuevamente...")
            O = O+1;
        end
    else
        msgbox("Diseño fallido, no es posible cumplir los requerimientos")
        Cw=tf(1)*tf(int);
        return;
    end
end

Cw=Cw1;

%margin(Cw*Gw)
%step(feedback(K*int*Controlador*Gz,1))
end