function [eta_0,gamma_0] = NewEtaGammaIni(T_0,epsilon_0,eta_e0, omega_0,d)
    eta_0 = zeros(18,1);
    g = 9.81; %Gravity
    eta_0(1,:) = epsilon_0(1)*(epsilon_0(3)-d)*T_0;
    eta_0(2,:) = epsilon_0(2)*eta_e0*T_0;
    eta_0(3,:) = epsilon_0(2)*(epsilon_0(3)-d)*T_0;
    eta_0(4,:) = epsilon_0(1)*eta_e0*T_0;
    eta_0(5,:) = epsilon_0(1)^2*T_0;
    eta_0(6,:) = 2*epsilon_0(2)^2*T_0+g;

    eta_0(7,:) = ((epsilon_0(3) - d)*omega_0(2))/2;
    eta_0(8,:) = (epsilon_0(2)*omega_0(3))/2;
    eta_0(9,:) = (eta_e0*omega_0(1))/2;
    eta_0(10,:) = (epsilon_0(1)*omega_0(3))/2;
    eta_0(11,:) = ((epsilon_0(3) - d)*omega_0(1))/2;
    eta_0(12,:) = (eta_e0*omega_0(2))/2;
    eta_0(13,:) = (epsilon_0(2)*omega_0(1))/2;
    eta_0(14,:) = (epsilon_0(1)*omega_0(2))/2;
    eta_0(15,:) = (eta_e0*omega_0(3))/2;
    eta_0(16,:) = (epsilon_0(1)*omega_0(1))/2;
    eta_0(17,:) = (epsilon_0(2)*omega_0(2))/2;
    eta_0(18,:) = ((epsilon_0(3) - d)*omega_0(3))/2;
    
    gamma_0 = zeros(6,1);
    gamma_0(1,:) = epsilon_0(1)^2;
    gamma_0(2,:) = epsilon_0(2)^2;
    gamma_0(3,:) = (epsilon_0(3)-d)^2;
    gamma_0(4,:) = omega_0(1)^2;
    gamma_0(5,:) = omega_0(2)^2;
    gamma_0(6,:) = omega_0(3)^2;
    % gamma_0(7,:) = (eta_e0)^2;

end