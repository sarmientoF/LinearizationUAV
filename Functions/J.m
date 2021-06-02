function JE = J(euler)
%Create matrix G or J_E
% JE = zeros(4,3);
epsilon_euler = euler(1:3);
eta_euler = euler(4);
JE =[eta_euler*eye(3) - tilde(epsilon_euler);
     -epsilon_euler'];
end