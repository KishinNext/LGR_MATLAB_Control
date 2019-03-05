%DISEÑO ADELANTO
format short
opcion=2;
Kv=5;
Kp=1;
Ka=5;

T=0.1;
MFd=60;
dBr=12;
O=5;
% 
 planta=zpk([],[-1 -2],5);
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
        %DESACTIVAR ERROR DE POSICIÓN Y COLOCAR EP=0
    elseif contador==1
        %DESACTIVAR ERROR DE POSICIÓN Y COLOCAR EP=0
            lim=evalfr(minreal(s*Gw),0);
            K=Kv/lim;   
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
        %DESACTIVAR ERROR DE POSICIÓN Y ACELERACIÓN COLOCAR EP,EV=0  
    elseif contador==1
            y=1;
            int=1/(s^(y));
            lim=evalfr(minreal(int*s^2*Gw),0);
            K=Ka/lim; 
        %DESACTIVAR ERROR DE POSICIÓN Y ACELERACIÓN COLOCAR EP,EV=0 
    elseif contador==2
            lim=evalfr(minreal(s^2*Gw),0);
            K=Ka/lim; 
        %DESACTIVAR ERROR DE POSICIÓN Y ACELERACIÓN COLOCAR EP,EV=0 
    elseif contador>2
       %DESACTIVAR todos los errores
    end
else
    K=1;
end

% if K==0
%    Gw=Gw*int;
% else
%     Gw=Gw*K*int;
% end


[Gm,Pm,Wcg,Wcp]=margin(Gw);

Gm_DB=20*log10(Gm);
%DISEÑO ATRASO
w=0:0.00001:100;
[MAGa,PHASEa,Xa]=bode(Gw,w);
Magnituda=reshape(MAGa,[],1);
MagnitudDBa=20*log10(Magnituda);
Phasea=reshape(PHASEa,[],1);
frecuenciaa=reshape(Xa,[],1);
cala=0;
%disp("Diseñando...")
for k=1:10000
    [fia,~]=find(MagnitudDBa>(cala-0.5) & MagnitudDBa<(cala+0.5));
    phasemodificada=Phasea(fia(1));
    MFd2=phasemodificada;
    MF=MFd2+6-180;
    MF=360+MF;
    wg=frecuenciaa(fia(1));
    mg=MagnitudDBa(fia(1));
    a=10^-(mg/20);
    T1=10/(a*wg);
    Cw=tf([a*T1 1],[T1 1]);
    Cw=Cw;
    [Gma2,Pma2,Wcga2,Wcpa2]=margin(Gw*Cw);
    
    Gma_dB2 = 20*log10(Gma2);
        if (Pma2<(MFd+0.9)) && (Pma2>(MFd-0.9))
            disp("Diseño exitóso.")
            Cw=Cw;
            break;
        else 
            disp("Realizando modificaciones... moviendo fase.")
            if Pma2<MFd
                cala=cala+1;
                
            else
                cala=cala-1;
            end
            disp(Pma2)
        end
end

Cz=c2d(Cw,T,'tustin');
[num,den]=tfdata(Cz,'v');
disp("El programa há finalizado.")