%Graficas
function graficar(planta)
figure 
step(planta);
[~,t] = step(planta);
t = 0:planta.Ts:t(end);
figure 
lsim(planta,t,t);%Rampa
figure
lsim(planta,t.^2,t);%Parabola
end