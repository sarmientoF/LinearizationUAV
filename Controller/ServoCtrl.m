%% Controller Settings 

C =[eye(3), zeros(3, 35); 
    zeros(1, 9), 1, zeros(1, 28)]; % position and eta

D = zeros(4);
S = [A, B; C, D];

A_a = [A, B; zeros(4, 38), zeros(4)];
B_a = [zeros(38, 4); eye(4)];
C_a = [C, D];



Q = zeros(42, 42);
Q(1:3,1:3) = diag(1*[10, 10, 100]);
Q(4:6,4:6) = diag([9, 9, 9]);
Q(7:10,7:10) = diag([5, 5, 5, 5]);
Q(11:13,11:13) = diag(.10*[20, 20, 20]);
Q(14,14) = 100;
Q(39:42,39:42) = diag([100, 100, 500, 500]);

R = 10 * diag([1;1;1;1]);

F_a = lqr(A_a, B_a, Q, R);

FS = -F_a * inv(S);
fprintf("🚨 Determinant S: " + det(S) + "\n")
F1 = FS(:, 1:38);
F2 = FS(:, 39:end);

%% Inital Condition

th_0 = 0;
% params = Parameters(th_0);
% maxW = 30;


%% Target 
p_t = 0.9 * [0; 2; 3];
v_t = [0; 0; 0];
k   = [0; 0; 1];
th_t = th_0;

euler_t = [k * sind(th_t); cosd(th_t)];
omega_t = [0; 0; 0];
T_t = 9.81;
d = params.d;
[eta_t,gamma_t] = EtaGammaIni(T_t,euler_t, omega_t, d);


% y_d = euler_t; % euler
y_d = [p_t; euler_t(4)];
z_d = [p_t;v_t; euler_t; omega_t; T_t; eta_t; gamma_t];
z_0 = [params.p_0;params.v_0; params.euler_0; params.omega_0; params.T_0; params.eta_0; params.gamma_0];


sim('IMC_LQR'); % Non Linear System
% sim('Servo_Validation');
% return 


