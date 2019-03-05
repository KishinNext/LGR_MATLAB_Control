clear all;
clc;
s=tf('s');
format short
T=0.1;
plantad=(2*s+1)/(s*(s+1)*(0.2*s+1))
%plantad2=zpk([-0.5],[0 -1 -5],10);
plantad2=zpk([-0.5],[1.618 -0.618],1)
plantad2=zpk([-0.5],[ 0 -1 -5],10)

Gz=c2d(plantad2,T)
%Gz=zpk([-0.5],[1.618 -0.618],1,T)
res1=caltmin(Gz,2);
var=fieldnames(res1)
