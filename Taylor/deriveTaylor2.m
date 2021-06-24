clear, clc
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
Tg = sym('Tg', 'real');


% Gavity
g = sym('g', 'real');

% Define X, euler
x = [p' v' epsilon' eta  omega' T Tg]';
% x = [p' v' epsilon' eta  omega' T]';
euler = [epsilon' eta]';

% Calculation of time derivatives 
dpdt = v;
% dvdt = r_z(epsilon, eta, 0) * T + [0 0 -1]' * g;
dvdt = r_z(epsilon, eta, 0) * T + [0 0 -1]' * (T - Tg) ;

deulerdt = 1/2 * J(euler) * omega;
depsilondt = deulerdt(1:3);
detadt =  deulerdt(4);

domegadt= w(1:3);
dTdt = w(4);
dTgdt = w(4);

% Define DxDt
% dxdt = [dpdt' dvdt' depsilondt' detadt' domegadt' dTdt']';
dxdt = [dpdt' dvdt' depsilondt' detadt' domegadt' dTdt' dTgdt']';

dxdt = expand(dxdt);




% jacobian(dxdt, [epsilon; eta; omega; T])
x_0 = [zeros(1, 3), zeros(1, 3), zeros(1, 3), 1, zeros(1, 3), 9.81, 0]';
A = jacobian(dxdt, x);
B = jacobian(dxdt, w);
A = subs(A, x, x_0);
B = subs(B, x, x_0);
A = double(A);
B = double(B);

% C =[eye(3), zeros(3, 35); 
%     zeros(1, 9), 1, zeros(1, 28)]; 

% D = zeros(4);
% S = [A, B; C, D];

Co = rank(ctrb(A,B));
% Ob = rank(obsv(A,C));
% detS = det(S);
fprintf("🕹 Rank Ctrb: " +  Co + "\n")
% fprintf("🕹 Rank Obsv: " +  Ob + "\n")
% fprintf("🚨 Determint: " +  detS + "\n")

