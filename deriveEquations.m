clear, clc
addpath("Functions")
% Symbolic variables
p = sym('p', [3, 1],'real');
v = sym('v', [3, 1],'real');
epsilon = sym('epsilon', [3, 1],'real');
eta = sym('eta', 'real');
omega = sym('omega', [3, 1],'real');
w1 = sym('w1_%d', [3, 1],'real');
w2 = sym('w2', 'real');
w = [w1; w2];
T = sym('T', 'real');

% Gavity
g = sym('g', 'real');

% Define X, euler
x = [p' v' epsilon' eta  omega' T]';
euler = [epsilon' eta]';

% Calculation of time derivatives 
dpdt = v;
dvdt = r_z(epsilon, eta, 0) * T + [0 0 -1]' * g;

deulerdt = 1/2 * J(euler) * omega;
depsilondt = deulerdt(1:3);
detadt =  deulerdt(4);

domegadt= w(1:3);
dTdt = w(4);

% Define DxDt
dxdt = [dpdt' dvdt' depsilondt' detadt' domegadt' dTdt']';

dxdt = expand(dxdt);


%% Auxiliary parameters
% Original Model
Eta = sym('ETA_%d', [18, 1],'real');

mEta = [epsilon(1)*epsilon(3)*T;
       epsilon(2)*eta*T;
       epsilon(2)*epsilon(3)*T;
       epsilon(1)*eta*T;
       epsilon(1)^2*T;
       2*epsilon(2)^2*T + g;
       (epsilon(3)*omega(2))/2;
       (epsilon(2)*omega(3))/2;
       (eta*omega(1))/2;
       (epsilon(1)*omega(3))/2;
       (epsilon(3)*omega(1))/2;
       (eta*omega(2))/2;
       (epsilon(2)*omega(1))/2;
       (epsilon(1)*omega(2))/2;
       (eta*omega(3))/2;
       (epsilon(1)*omega(1))/2;
       (epsilon(2)*omega(2))/2;
       (epsilon(3)*omega(3))/2];

dxdt = subs(dxdt, mEta, Eta);



%%%%%%%%%%%%%%%%%
d_epsilon = sym('d_epsilon', [3, 1],'real');
d_eta = sym('d_eta','real');
d_omega = sym('d_omega', [3, 1],'real');
d_T = sym('d_T','real');


jacobian(mEta, [epsilon; eta; omega; T]) * [d_epsilon; d_eta; d_omega; d_T];

%%%%%%%%%%%%%%%%%%%%%%%%
Gamma = sym('Gamma', [7 1], 'real');
mGamma = [epsilon.^2; omega.^2];

jacobian(mGamma, [epsilon; omega]) * [d_epsilon; d_omega];

J_E = J(euler);
mOmega =  2 * inv(J_E(1:3, :)) * w1 ;
mOmega = simplify(mOmega);


mOmega_d = jacobian(mOmega, [epsilon; eta]) * [d_epsilon; d_eta];
mOmega_d = simplify(mOmega_d)