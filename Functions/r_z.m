function r_z=r_z(epsilon,eta_e,d)
r_z = [2*(epsilon(1)*(epsilon(3)-d)+epsilon(2)*eta_e);
       2*(epsilon(2)*(epsilon(3)-d)-epsilon(1)*eta_e);
       1+2*(-epsilon(1)^2-epsilon(2)^2)];
end