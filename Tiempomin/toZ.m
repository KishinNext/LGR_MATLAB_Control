function y=toZ(Fz,Periodo)
        fz=0;
        Fz=fliplr(Fz);
        z=tf('z',Periodo);
        
        for i=1:length(Fz)
            fz=fz+((Fz(i)*z^(i-1))/z^(length(Fz)-1));
        end
        
     y=minreal(fz);
end