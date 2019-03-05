function y=toZinv(Fz,Periodo)
        fz=0;
        Fz=fliplr(Fz)
        s=tf('z',Periodo);
        z=1/s
        
        for i=1:length(Fz)
            fz=fz+((Fz(i)*z^(i-1)));
        end
        
     y=minreal(fz);
end