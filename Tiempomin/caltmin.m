%%Tiempo minimo

function [matriz1,matriz2,Retardo,Dz,K]=caltmin(Gz,a,be,error,periodo)
    Z=cell2mat(Gz.Z)*-1
    assignin('base', 'Z', Z);
    
    P=cell2mat(Gz.P)*-1
    assignin('base', 'P', P);
    
    Retardo=length(P)-length(Z);
    assignin('base', 'retardo', Retardo);
    
    for i=1:Retardo
        resf(i)=0;
        
    end
    
    if isempty(Z)
        for i=1:Retardo
            resf(i)=0;
            
        end
        resf(Retardo+1)=1;
        assignin('base', 'resf', resf);
        Fz=resf;
    else
        res=[1,(Z(1))];
        for i=2:length(Z)
            res=conv(res,[1,Z(i)]);
        end
        Fz=horzcat(resf,res);
        
    end
    Fz
    assignin('base', 'Fz', Fz);
    if be
        %Fzz=fzz2(a,P)
        Fzz=fzz(a,P)
    else
        Fzz=fzz(a,P)
        
    end
    
    assignin('base', 'Fzz', Fzz);
    disp("OFz")
    ordenFz=(length(Fz)-1);
    disp(ordenFz)
    orden1Fz=(length(Fzz)-1);
    disp("OFzz")
    
    disp(orden1Fz)
    
    if be
        if(length(Fz)>length(Fzz))
            Mm=orden1Fz;
            Am=ordenFz;
            M=sym('m', [1 Mm+1]);
            A=sym('a', [1 Am+1]);
        end
        if(length(Fz)<length(Fzz))
            Mm=orden1Fz;
            Am=ordenFz;
            M=sym('m', [1 Mm+1]);
            A=sym('a', [1 Am+1]);
        end
        if(length(Fz)==length(Fzz))
            M=sym('m', [1 orden1Fz+1]);
            A=sym('a', [1 orden1Fz+1]);
        end
    else
        if(length(Fz)>length(Fzz))
            dif=ordenFz-orden1Fz;
            Mm=orden1Fz-1;
            Am=orden1Fz+dif-1;
            M=sym('m', [1 Mm+1]);
            A=sym('a', [1 Am+1]);
        end
        if(length(Fz)<length(Fzz))
            ordenFz=(length(Fz)-1);
            orden1Fz=(length(Fzz)-1);
            Mm=orden1Fz;
            Am=ordenFz;
            M=sym('m', [1 Mm]);
            A=sym('a', [1 Am]);
        end
        if(length(Fz)==length(Fzz))
            M=sym('m', [1 ordenFz]);
            A=sym('a', [1 ordenFz]);
        end
        
    end
    
    M
    A(1,1)=1;
    A
    if find(Retardo~=0)
        aux=Fz;
        clear Fz;
        Fz=aux(1,Retardo+1:end);
    end
    assignin('base', 'Fz', Fz);
    
    matriz1=vpa(matsym(Fz,M),3)
    assignin('base', 'fzfinal', matriz1);
    
    matrizt=matsym(Fzz,A);
    %matriz2=vpa(matrizt(:,2:end).*-1,3)
    matriz2=vpa(matrizt(:,2:end).*-1,3)
    
    assignin('base', 'fzzfinal', matriz2);
    
    [~,b]=size(matriz1);
    for i=1:b
        nume(i)=sum(matriz1(:,i));
        deno(i)=sum(matriz2(:,i));
        eq(i)=sum(matriz1(:,i))- sum(matriz2(:,i))==0
    end
    eq;
    if(be)
        switch a
            case 1
                disp("Kv")
                eq3=error*Gz.Ts*sum(A)==sum(M);
                eq=horzcat(eq,eq3);
            case 2
                disp("Ka")
                eq3=error*Gz.Ts*Gz.Ts*sum(A)==sum(M)
                eq=horzcat(eq,eq3);
                
        end
        
    end
    
    respuestas=horzcat(A(2:end),M);
    respuestas=solve(eq);
    campos= fieldnames(respuestas);
    matriz1=subs(matriz1, respuestas);
    matriz2=subs(matriz2, respuestas);
    Mz=subs(M,respuestas)
    Az=subs(A,respuestas)
    vector1=double(conver(Fz));
    Fz2=zeros(1,length(vector1));
    Fz2(1:length(vector1))=vector1(:);
    fz=toZ(aux,periodo);
    mz=toZ(double(conver(Mz)),periodo);
    az=toZ(double(conver(Az)),periodo);
    fz2=toZ(conver(Fzz),periodo);
    %Dz=minreal((fz*mz)/(Gz*(fz2*az)))
    Dz=minreal((fz*mz)/(Gz*(fz2*az)));
    s=tf('s');
    intd=c2d(1/s,periodo);
    Dz=Dz;
    K=errores(Dz,Gz,periodo);
    error;
    
    
    
    if(be)
        
        switch a
            case 1
                disp("Kv")
                K(1)=(sum(Mz)/sum(Az))/(periodo);
                K(2)=(sum(Mz)/sum(Az))/(periodo*periodo)
            case 2
                disp("Ka")
                K(1)=inf;
                K(2)=(sum(Mz)/sum(Az))/(periodo*periodo)
        end
    end
    switch a
        case 3
            K(1)=inf;
            K(2)=inf;
    end
end