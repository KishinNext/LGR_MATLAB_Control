%%Crea 1-Fz
function y=fzz(a,P)
    u=[1 -1];%Escalon
    r=conv(u,u);%Rampa
    p=conv(r,u);%Parabola
    
    bandera=0;
    if(find(abs(P)>1))
        bandera=1;
        [row,col]=find(abs(P)>1);
        polo=([1,P(row(1),1)]);
    end
    if(bandera==1)
        for i=2:length(row)
            polo=conv(polo,[1,P(i,1)]);
            
        end
        switch a
            case 1
                Fzz=conv(u,polo);
                
            case 2
                Fzz=conv(r,polo);
                
            case 3
                Fzz=conv(p,polo);
        end
    else
        if(a==1)
            Fzz=u;
            
        end
        
        if(a==2)
            Fzz=r;
            
        end
        if(a==3)
            Fzz=p;
            
        end
    end
        y=Fzz;
    end