%%Crea matriz
function y=matsym(Fz,M)
    syms z
    Fzsym=vpa(poly2sym(fliplr(Fz),z),3);%Convierte a simbolico
    res1=vpa(M.*Fzsym,3);
    [~,b]=size(res1);
    for i=1:b
        coef(i,:)=vpa((coeffs(res1(i),z)),3);
    end
    [a,b]=size(coef);
    
    X =sym(zeros(a,b));
    j=0;
    for i=1:a
        X(i,i:b+j)=coef(i,:);
        j=j+1;
    end
    
y=X;


end