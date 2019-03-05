close all;
clear all;
clc;
format long
s=tf('s');
g=exp(-5*s)/(s+0.4);
%g=1/(s*(s+2));
%[periodo]=periodoopciones(Mp,ts,zita,wn,n,G)
[T]=periodoopciones(0,0,0.5,4,1,g);
Gd=c2d(g,T,'zoh');
[Pd,ang]=opcionb(g,0.5,10,T);
[controlador]=PD(Pd,ang,T,g);
%[controlador]=PI(Pd,ang,T,g,1);
%[controlador]=Compensadorpolo(Pd,ang,T,g,70);
Gf=controlador*Gd;
Gfinal=feedback(controlador*Gd,1);
[k,e]=errores(controlador,Gd,T);
%figure,plot(real(Pd),imag(Pd),'*k','MarkerSize',10), hold on, rlocus(Gd*controlador); 
 graficar(Gfinal);
% %[a,controlador2]=eestacionario(opcion,K,e,controlador,Gd,T,Pd,ang)
 [a,controlador2]=eestacionario(3,0.3,controlador,Gd,T,Pd,ang);
 Gf2=Gf*controlador2;
 Gfinal2=feedback(Gf2,1);
  [k1,e1]=errores(controlador2,controlador*Gd,T);
 graficar(Gfinal2);
 
%figure,plot(real(Pd),imag(Pd),'*k','MarkerSize',10), hold on, rlocus(Gd*controlador); 
