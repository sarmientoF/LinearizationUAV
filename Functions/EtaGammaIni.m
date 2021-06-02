function [eta_0,gamma_0] = EtaGammaIni(T_0,epsilon_0,eta_e0,d)
    eta_0 = zeros(6,1);
    g = 9.81; %Gravity
    eta_0(1,:) = epsilon_0(1)*(epsilon_0(3)-d)*T_0;
    eta_0(2,:) = epsilon_0(2)*eta_e0*T_0;
    eta_0(3,:) = epsilon_0(2)*(epsilon_0(3)-d)*T_0;
    eta_0(4,:) = epsilon_0(1)*eta_e0*T_0;
    eta_0(5,:) = epsilon_0(1)^2*T_0;
    eta_0(6,:) = 2*epsilon_0(2)^2*T_0+g;

    gamma_0 = zeros(3,1);
    gamma_0(1,:) = epsilon_0(1)^2;
    gamma_0(2,:) = epsilon_0(2)^2;
    gamma_0(3,:) = (epsilon_0(3)-d)^2;
end