clear all;
clc;
s=tf('s');
format short
T=0.1;
plantad=(2*s+1)/(s*(s+1)*(0.2*s+1))
%plantad2=zpk([-0.5],[0 -1 -5],10);
plantad2=zpk([-0.5],[1.618 -0.618],1)

polo=0;
Gz=c2d(plantad2,T)
Gz=zpk([-0.5],[1.618 -0.618],1,T)

Z=cell2mat(Gz.Z)*-1
P=cell2mat(Gz.P)*-1
Retardo=length(P)-length(Z);
for i=1:Retardo
    resf(i)=0;
end
res=[1,(Z(1))];
for i=2:length(Z)
    res=conv(res,[1,Z(i)]);
end

Fz=horzcat(resf,res)
% 
% if(find(abs(P)>1))
%     bandera=1;
%     [row,col]=find(abs(P)>1);
%     polo=(P(1,col(1)));
% end

a=1;
Fzz=fzz(a,P)

if(length(Fz)>length(Fzz))
    M=sym('m', [1 length(Fz)-length(Fzz)+1]);
    A=sym('a', [1 length(Fz)-1]);
end
if(length(Fz)<length(Fzz))
    M=sym('m', [1 length(Fzz)-1]);
    A=sym('a', [1 length(Fzz)-length(Fz)+1]);
end
if(length(Fz)==length(Fzz))
    M=sym('m', [1 length(Fz)-1]);
    A=sym('a', [1 length(Fz)-1]);
end
A(1,1)=1;
matriz1=vpa(matsym(Fz,M),3)
matrizt=matsym(Fzz,A);
matriz2=vpa(matrizt(:,2:end).*-1,3)

[~,b]=size(matriz1);
for i=1:b
    eq(i)=sum(matriz1(:,i))- sum(matriz2(:,i))==0;

end
eq
%%
[a2,m1,m2]=solve(eq)