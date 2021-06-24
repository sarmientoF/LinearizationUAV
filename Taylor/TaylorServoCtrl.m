C = zeros(4,14);
% C(1:4, 7:10) = eye(4);
C(1:3, 1:3) = eye(3);
C(4, 10) = 1;

A_a = [A B;
       zeros(4,14) zeros(4,4)];
B_a = [zeros(14,4);
        eye(4,4)];

C_a = [C, zeros(4)];


Q = zeros(18, 18);
Q(1:3,1:3) = diag([10, 10, 100]);
Q(4:6,4:6) = diag([9, 9, 9]);
Q(7:10,7:10) = diag([5, 5, 5, 5]);
Q(11:13,11:13) = diag([20, 20, 20]);
Q(14,14) = 100;
Q(15:18,15:18) = diag([100, 100, 500, 500]);

% Q_at = diag([10,10,100,9,9,9,5,5,5,100,100,100,500,500]);
R = diag([1,1,1,1]);
Co = rank(ctrb(A_a,B_a))
Ob = rank(obsv(A_a,C_a))

% coder.extrinsic('lqr');
Fa_t = lqr(A_a, B_a, Q,R);

S = [A B;
     C zeros(4)];

INV_S = inv(S); 
F1F2 = -Fa_t*INV_S;

F1_t = F1F2(:,1:10);
F2_t = F1F2(:,11:length(Aa_t));

