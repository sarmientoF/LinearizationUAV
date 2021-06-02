clear, clc, close all
%% Load Parameters
params = NewParameters;
maxStepSize=params.maxStepSize;

outputUAV1 = load(params.trainigPath + "OutputUAV1");
[x1, w1, eta1, gamma1, d_eta1, d_gamma1] = deal(outputUAV1.x, outputUAV1.w, outputUAV1.eta, outputUAV1.gamma, outputUAV1.d_eta, outputUAV1.d_gamma);

outputUAV2 = load(params.trainigPath + "OutputUAV2");
[x2, w2, eta2, gamma2, d_eta2, d_gamma2] = deal(outputUAV2.x, outputUAV2.w, outputUAV2.eta, outputUAV2.gamma, outputUAV2.d_eta, outputUAV2.d_gamma);

outputUAV3 = load(params.trainigPath + "OutputUAV3");
[x3, w3, eta3, gamma3, d_eta3, d_gamma3] = deal(outputUAV3.x, outputUAV3.w, outputUAV3.eta, outputUAV3.gamma, outputUAV3.d_eta, outputUAV3.d_gamma);

%% Concatenate the data
x = [x1,x2,x3]; %Concatenate the total states from 3 data sets
w = [w1,w2,w3]; %Concatenate the input from 3 data sets
eta = [eta1,eta2,eta3]; %Concatenate the auxiliry variables from 3 data sets
gamma = [gamma1,gamma2,gamma3]; %Concatenate the auxiliry variables from 3 data sets
d_eta = [d_eta1,d_eta2,d_eta3]; %Concatenate the time derivative of the auxiliry variables from 3 data sets
d_gamma = [d_gamma1,d_gamma2,d_gamma3]; %Concatenate the time derivative of the auxiliry variables from 3 data sets
xi = [x;eta;gamma;w]; % Put all the concatenated states and input together

%% Define Regression Matrix
%Initialize the expectation
E1 = zeros(params.dim_eta+params.dim_gamma,params.dim_xi);
E2 = zeros(params.dim_xi,params.dim_xi);

for i=1:length(x)
    E1 = E1 + [d_eta(:,i);d_gamma(:,i)]*xi(:,i)';
    E2 = E2 + xi(:,i)*xi(:,i)';
end

% Compute the regession matric block
% H_DFL=E1_eta/(E2_eta);
H_DFL = E1 * inv(E2);


dXi = params.dim_xi;
dX = params.dim_x;
dU = params.dim_u;
dE = params.dim_eta;
dG = params.dim_gamma;
% Define each system matrix from above
H_x =     H_DFL(1:dE,           1: dX          );
H_eta =   H_DFL(1:dE,      dX + 1: dX + dE     );
H_gamma = H_DFL(1:dE, dX + dE + 1: dX + dE + dG);
H_u =     H_DFL(1:dE,dXi - dU + 1: dXi         );

F_x =     H_DFL(dE + 1: dE + dG,           1: dX          );
F_eta =   H_DFL(dE + 1: dE + dG,      dX + 1: dX + dE     );
F_gamma = H_DFL(dE + 1: dE + dG, dX + dE + 1: dX + dE + dG);
F_u =     H_DFL(dE + 1: dE + dG,dXi - dU + 1: dXi         );


%% Construct DFL model
A_x = [zeros(3,3), eye(3,3),   zeros(3,3), zeros(3,1), zeros(3,3), zeros(3,1);
       zeros(3,3), zeros(3,3), zeros(3,3), zeros(3,1), zeros(3,3), [0;0;1];
       zeros(3,3), zeros(3,3), zeros(3,3), zeros(3,1), zeros(3,3), zeros(3,1);
       zeros(1,3), zeros(1,3), zeros(1,3), zeros(1,1), zeros(1,3), zeros(1,1);
       zeros(3,3), zeros(3,3), zeros(3,3), zeros(3,1), zeros(3,3), zeros(3,1);
       zeros(1,3), zeros(1,3), zeros(1,3), zeros(1,1), zeros(1,3), zeros(1,1)];


        % 1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13, 14, 15, 16, 17, 18;
A_eta = [zeros(3, 18);
         +2, +2, +0, +0, +0, +0, +0, +0, +0, +0, +0, +0, +0, +0, +0, +0, +0, +0;
         +0, +0, +2, -2, +0, +0, +0, +0, +0, +0, +0, +0, +0, +0, +0, +0, +0, +0;
         +0, +0, +0, +0, -2, -1, +0, +0, +0, +0, +0, +0, +0, +0, +0, +0, +0, +0;
         +0, +0, +0, +0, +0, +0, +1, -1, +1, +0, +0, +0, +0, +0, +0, +0, +0, +0;
         +0, +0, +0, +0, +0, +0, +0, +0, +0, +1, -1, +1, +0, +0, +0, +0, +0, +0;
         +0, +0, +0, +0, +0, +0, +0, +0, +0, +0, +0, +0, +1, -1, +1, +0, +0, +0;
         +0, +0, +0, +0, +0, +0, +0, +0, +0, +0, +0, +0, +0, +0, +0, -1, -1, -1;
         zeros(4, 18)];

A_gamma = zeros(14,dG);

B_u = [zeros(3,3) zeros(3,1);
       zeros(3,3) zeros(3,1);
       zeros(3,3) zeros(3,1);
       zeros(1,3) zeros(1,1);
       eye(3,3)   zeros(3,1);
       zeros(1,3) 1];
       
A = [A_x, A_eta, A_gamma;
     H_x, H_eta, H_gamma;
     F_x, F_eta, F_gamma];

B = [B_u;
     H_u;
     F_u];

     
% C = eye(19);
% D = zeros(19,4);
% Find Rank the Controlabgility Matrix
Rank_control = rank(ctrb(A,B));

NewModelValidation

