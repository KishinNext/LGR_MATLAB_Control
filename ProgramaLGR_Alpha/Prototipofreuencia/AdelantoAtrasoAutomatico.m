clc
clearvars;
close all;
format short;
%DISEÑO ADELANTO
%Parámetros
%parametros ejercicio
T=0.1;
Kv=5;
MFd=60;
dBr=12;
O=30;
planta=zpk([],[-1 -2],1);
%RECORDAR CAMBIAR EL NÚMERO DE INTEGRADORES

Gz=c2d(planta,T,'zoh');
Gw=d2c(Gz,'tustin');
s=tf('s');
int=1/s;
intd=c2d(int,T,'tustin');
lim=evalfr(minreal(int*s*Gw),0);
K=Kv/lim;
Gw=Gw*K;
margin(int*Gw);


[Gm,Pm,Wcg,Wcp]=margin(Gw);
Gm_DB=20*log10(Gm);
if Gm_DB>dBr
    
    disp("Diseño de controlador en adelando.")
    MFr=Pm;
    phi=MFd-MFr+O;
    b=(1+sind(phi))/(1-sind(phi));
    cal=-10*log10(b);
    for k=1:90
        if b>0 && (0<phi) && (phi<90)
            disp("Diseñando...")
            w=1:0.0001:1000;
%             figure
%             bode(Gw,w);
            [MAG,PHASE,X]=bode(Gw,w);
            Magnitud=reshape(MAG,[],1);
            MagnitudDB=20*log10(Magnitud);
            Phase=reshape(PHASE,[],1);
            frecuencia=reshape(X,[],1);
            [fi,~]=find(MagnitudDB>(cal-0.0004) & MagnitudDB<(cal+0.0004));
            phi2=MFr-Phase(fi(1)); %PREGUNTAR
            if (phi2)<O
                disp("Diseño exitoso.")
                T2=1/(frecuencia(fi(1))*sqrt(b));
                Cw=tf([b*T2 1],[T2 1]);
                Cz=c2d(Cw,T,'tustin');
                margin(Gw*Cw)
                break;
            else
                disp("Se necesita modificar theta, se diseña nuevamente...")
                O = O+1;
            end
        else
            disp("Diseño fallido, no es posible cumplir los requerimientos")
        end
    end
[Gmf,Pmf,Wcgf,Wcpf]=margin(Gw*Cw);
Gm_DB=20*log10(Gmf);
 %%
if Gmf~=dBr
    %DISEÑO ADELANTO
    disp("Diseño de un controlador en adelanto necesario.")
    Gwa=Cw*Gw;
    [Gma,Pma,Wcga,Wcpa]=margin(Gwa);
    wa=1:0.0001:1000;
    %figure
    %bode(Gwa,wa);
    [MAGa,PHASEa,Xa]=bode(Gwa,wa);
    Magnituda=reshape(MAGa,[],1);
    MagnitudDBa=20*log10(Magnituda);
    Phasea=reshape(PHASEa,[],1);
    frecuenciaa=reshape(Xa,[],1);
    
    cala=0;
    disp("Diseñando...")
    for k=1:10000

    [fia,~]=find(MagnitudDBa>(cala-0.0004) & MagnitudDBa<(cala+0.0004));
    phasemodificada=Phasea(fia(1));
    MFd2=phasemodificada;
    MF=MFd2+6-180;
    MF=360+MF;
    wg=frecuenciaa(fia(1));
    mg=MagnitudDBa(fia(1));

    a=10^-(mg/20);
    T1=10/(a*wg);
    catraso=tf([a*T1 1],[T1 1]);
    %figure
    %margin(Gwa*catraso);
    [Gma2,Pma2,Wcga2,Wcpa2]=margin(Gwa*catraso);
    Gma_dB2 = 20*log10(Gma2);
        if (Pma2<(MFd+0.04)) && (Pma2>(MFd-0.04))
            disp("Diseño exitóso.")
            break;
        else 
            disp("Realizando modificaciones... moviendo fase.")
            if Pma2<MFd
                cala=cala+0.001;
                
            else
            cala=cala-0.001;
            end
            disp(phasemodificada)
        end
    end
    figure
    margin(Gwa*catraso);
     disp("El programa há finalizado.")
else
    disp("No es posible cumplir los requerimientos.")
end

else
    
    
    %DISEÑO ADELANTO
    disp("Diseño de un controlador en atraso atnecesario.")
    Gwa=Gw;
    [Gma,Pma,Wcga,Wcpa]=margin(Gwa);
    wa=1:0.0001:1000;
    %figure
    %bode(Gwa,wa);
    [MAGa,PHASEa,Xa]=bode(Gwa,wa);
    Magnituda=reshape(MAGa,[],1);
    MagnitudDBa=20*log10(Magnituda);
    Phasea=reshape(PHASEa,[],1);
    frecuenciaa=reshape(Xa,[],1);
    MF=MFd+6-180;
    MF=360+MF;
    disp("Diseñando...")
    [fia,~]=find(Phasea>(MF-0.004) & Phasea<(MF+0.004));

    wg=frecuenciaa(fia(1));
    mg=MagnitudDBa(fia(1));

    a=10^-(mg/20);
    T1=10/(a*wg);
    catraso=tf([a*T1 1],[T1 1]);
    figure
    margin(Gwa*catraso);
    [Gma2,Pma2,Wcga2,Wcpa2]=margin(Gwa*catraso);
    Gma_dB2 = 20*log10(Gma2);
    %%
    disp("Diseño de controlador en adelando.")
    MFr=Pma2;
    phi=190-MFr+O;
    b=(1+sind(phi))/(1-sind(phi));
    cal=-10*log10(b);
    for k=1:90
        if b>0 && (0<phi) && (phi<90)
            disp("Diseñando...")
            w=1:0.0001:1000;
            figure
            bode(Gw,w);
            [MAG,PHASE,X]=bode(Gw,w);
            Magnitud=reshape(MAG,[],1);
            MagnitudDB=20*log10(Magnitud);
            Phase=reshape(PHASE,[],1);
            frecuencia=reshape(X,[],1);
            [fi,~]=find(MagnitudDB>(cal-0.0004) & MagnitudDB<(cal+0.0004));
            phi2=MFr-Phase(fi(1));
            if (phi2)<O
                disp("Diseño exitoso.")
                T2=1/(frecuencia(fi(1))*sqrt(b));
                Cw=tf([b*T2 1],[T2 1]);
                Cz=c2d(Cw,T,'tustin');
                margin(Gw*Cw)
                break;
            else
                disp("Se necesita modificar theta, se diseña nuevamente...")
                O = O+1;
            end
        else
            disp("Diseño fallido, no es posible cumplir los requerimientos")
            break;
        end
    end

end