function [eta_0,gamma_0] = EtaGammaIni(T_0,euler, omega_0,d)
    eta_0 = zeros(18,1);
    g = 9.81; %Gravity
    eta_0(1,:) = euler(1)*(euler(3)-d)*T_0;
    eta_0(2,:) = euler(2)*euler(4)*T_0;
    eta_0(3,:) = euler(2)*(euler(3)-d)*T_0;
    eta_0(4,:) = euler(1)*euler(4)*T_0;
    eta_0(5,:) = euler(1)^2*T_0;
    eta_0(6,:) = 2*euler(2)^2*T_0+g;

    eta_0(7,:) = ((euler(3) - d)*omega_0(2))/2;
    eta_0(8,:) = (euler(2)*omega_0(3))/2;
    eta_0(9,:) = (euler(4)*omega_0(1))/2;
    eta_0(10,:) = (euler(1)*omega_0(3))/2;
    eta_0(11,:) = ((euler(3) - d)*omega_0(1))/2;
    eta_0(12,:) = (euler(4)*omega_0(2))/2;
    eta_0(13,:) = (euler(2)*omega_0(1))/2;
    eta_0(14,:) = (euler(1)*omega_0(2))/2;
    eta_0(15,:) = (euler(4)*omega_0(3))/2;
    eta_0(16,:) = (euler(1)*omega_0(1))/2;
    eta_0(17,:) = (euler(2)*omega_0(2))/2;
    eta_0(18,:) = ((euler(3) - d)*omega_0(3))/2;
    
    gamma_0 = zeros(6,1);
    gamma_0(1,:) = euler(1)^2;
    gamma_0(2,:) = euler(2)^2;
    gamma_0(3,:) = (euler(3)-d)^2;
    gamma_0(4,:) = omega_0(1)^2;
    gamma_0(5,:) = omega_0(2)^2;
    gamma_0(6,:) = omega_0(3)^2;
end