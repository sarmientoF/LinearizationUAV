%% Inital Condition

th_0 = 10;
params = Parameters(th_0);
maxW = 30;


%% Controller Settings 
Q_x = 2.3e3*[1;1;1];
Q_v = 1e3*[5;5;5];
Q_e = .5e3*[1;1;1;2];
Q_omega =200 * [10;10;10];
Q_dfl = diag([Q_x;Q_v;Q_e;Q_omega]);

R = 1000 * diag([1;1;1;1]);
C_z = [eye(13,13),zeros(13,25)];
K = lqr(A,B,C_z'*Q_dfl*C_z,R);


% return
t_final = 40;

%% Target State
p_t = [0; 0; 0];
v_t = [0; 0; 0];
k   = [0; 0; 1];
th_t = 0;
euler_t = [k * sind(th_t); cosd(th_t)];
omega_t = [0; 0; 0];
T_t = 9.81;
d = params.d;
[eta_t,gamma_t] = EtaGammaIni(T_t,euler_t, omega_t, d);

z_d = [p_t;v_t; euler_t; omega_t; T_t; eta_t; gamma_t];
z_0 = [params.p_0;params.v_0; params.euler_0; params.omega_0; params.T_0; params.eta_0; params.gamma_0];

%% Simulation
outSim = sim('LQR');

p_err = outSim.p_err;
p_err(end, :)

% if(norm(p_err(end, :)) > 0.5)
%       GenerateTrainigInput
% end


% trainigPath = params.trainigPath;

% save(trainigPath + 'Matrixes','A', 'B', 'Q_x', 'Q_v', 'Q_e', 'Q_omega', 'Q_dfl', 'R', 'C_z', 'K');


% loaded = load(params.trainigPath + "Matrixes");

% A = loaded.A;
% B = loaded.B;
