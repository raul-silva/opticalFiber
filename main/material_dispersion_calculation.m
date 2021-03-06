clear all;
close all;
clc;
%%
syms lambda

n(lambda) = sqrt((0.6961663*lambda^2)/(lambda^2-0.0684043^2)+...
            (0.4079426*lambda^2)/(lambda^2-0.1162414^2)+...
            (0.8974794*lambda^2)/(lambda^2-9.896161^2)+1);

D(lambda) = -(lambda/Const.c0) .* diff(n, lambda, 2);        
D(lambda) = D(lambda) * (1e12);

fn = matlabFunction(n);
fD = matlabFunction(D);


lambda_A = linspace(0.8,3.8,500);

figure
plot(lambda_A, fn(lambda_A),'k'); grid
xlabel('\lambda (\mum)')
ylabel('Refractive index')
title('Fused silica, 20 �C')

figure
plot(lambda_A, fD(lambda_A),'k'); grid
xlabel('\lambda (\mum)')
ylabel('Dispersion [ps/(nm km)]')
title('Fused silica, 20 �C')