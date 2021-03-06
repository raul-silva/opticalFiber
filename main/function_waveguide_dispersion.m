function [v, d] = function_waveguide_dispersion (n1, n2, nu)
    a = 4e-6;
    lambda = linspace(0.8e-6, 3.8e-6, 100);
    na = sqrt(n1^2 - n2^2);
    v = 2 * pi * a * na ./ lambda;
    k0 = 2 * pi ./ lambda;
    
    for i = 1:length(lambda)
        neff = function_calc_neff(nu, k0(i), n1, n2, a);
        neff1 = neff(1);
        b(i) = (neff1.^2 - n2^2)/(n1^2 - n2^2);
    end
   
    P = polyfit(v, b, 5);
    
    fprintf('Tamanho v %f', length(v))
    fprintf('Tamanho lambda %f', length(lambda))
    syms vv
    bb(vv) = P(1)*vv^8 + P(2)*vv^7 + P(3)*vv^6 + P(4)*vv^5 + P(5)*vv^4;
    Dwn(vv) = (n2 * (n1 - n2)/n1 * 1/Const.c0) .* vv .* diff(vv .* bb, vv, 2);
    fDwn = matlabFunction(Dwn); 
    d = fDwn(v)./lambda *1e3;
end