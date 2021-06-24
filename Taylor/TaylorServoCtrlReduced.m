A_a = [A B;
       zeros(4,13) zeros(4,4)];
B_a = [zeros(13,4);
        eye(4,4)];

C_a = [C, zeros(4)];


Q = zeros(17, 17);
Q(1:3,1:3) = diag(2*[10, 10, 10]);
Q(4:6,4:6) = diag(2*[9, 9, 9]);
Q(7:9,7:9) = diag(10*[5, 5, 5]);
Q(10:12,10:12) = diag([20, 20, 20]);
Q(13,13) = 100;
Q(14:17,14:17) = diag([100, 100, 500, 500]);

% Q_at = diag([10,10,100,9,9,9,5,5,5,100,100,100,500,500]);
R = diag([1,1,1,1]);
Co = rank(ctrb(A_a,B_a));
Ob = rank(obsv(A_a,C_a));

% coder.extrinsic('lqr');
Fa_t = lqr(A_a, B_a, Q,R);

S = [A B;
     C zeros(4)];

INV_S = inv(S); 
F1F2 = -Fa_t*INV_S;

F1 = F1F2(:,1:13);
F2 = F1F2(:,14:17);

params = Parameters(20);

z_d = [zeros(1,3), zeros(1,3),zeros(1,3), 1, zeros(1,3), 9.81];
y_d = [zeros(1,3), zeros(1,3),zeros(1,3), zeros(1,3), 9.81];

maxW = 10;
sim("Taylor_Servo", 30)