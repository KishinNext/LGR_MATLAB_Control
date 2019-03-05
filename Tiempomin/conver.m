function y=conver(matriz)
 [~,b]=size(matriz);
    for i=1:b
        vector(i)=sum(matriz(:,i));
        
    end
y=vector;
end