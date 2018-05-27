clear all;
close all;
clc;
%%
lambda0 = 1.55e-6; % [m] operating wavelength
n2 = 1.475; % claddinn1 = 1.5; % core
a = 5.8e-6; % [m] core radius
nu = 2;

na = sqrt(n1^2-n2^2);
v = 2*pi*a*na/lambda0;
fprintf('Normalized frequency: %f \n',v)
fprintf('Quantity of modes propagating: %f \n %f \n',v^2/2)

%% neff
k0 = 2*pi/lambda0;
neff = function_calc_neff(nu,k0,n1,n2,a);
fprintf('Quantity of modes propagating: %d \n',length(neff))
fprintf('Effective refractive index: %f \n',neff)
b = (neff.^2-n2^2)/(n1^2-n2^2);
fprintf('Normalized propagation constant: %f \n',b)
%pcore = function_calc_pcore(nu,neff,k0,n1,n2,a);
%fprintf('Pcore/P: %f \n',pcore)
%%



