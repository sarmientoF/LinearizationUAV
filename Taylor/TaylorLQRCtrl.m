%% Inital Condition

th_0 = 10;
params = Parameters(th_0);
maxW = 30;


%% Controller Settings 
Q = zeros(13, 13);
Q(1:3,1:3) = diag(2*[10, 10, 10]);
Q(4:6,4:6) = diag(2*[9, 9, 9]);
Q(7:9,7:9) = diag(10*[5, 5, 5]);
Q(10:12,10:12) = diag([20, 20, 20]);
Q(13,13) = 100;

R = 1 * diag([1;1;1;1]);
K = lqr(A,B,Q,R);


% return
t_final = 40;

%% Target State
params = Parameters(20);

z_d = [zeros(1,3), zeros(1,3),zeros(1,3), 1, zeros(1,3), 9.81];
y_d = [zeros(1,3), zeros(1,3),zeros(1,3), zeros(1,3), 9.81];
x_d = [z_d, zeros(1,4)];

maxW = 10;
t_final = 30;
outSim = sim("Taylor_LQR", t_final);
X_w = [outSim.X_w];
X_d = repmat(x_d, length(X_w), 1);
t_span = linspace(0,t_final,length(X_w));

plotOutputs(X_w, X_d, t_span, 'T_LQR_Dist')
