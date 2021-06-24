%% A, B, C, D is given by deriveTaylor
[MSYS,U] = minreal(ss(A, B, C, D));

rank(ctrb(MSYS.A, MSYS.B))

A = MSYS.A;
B = MSYS.B;
C = MSYS.C;
D = MSYS.D;
