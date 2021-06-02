% Randn Normally distributed pseudorandom numbers.
% % Randn Normally distributed pseudorandom numbers.
N = 1E4;
% u_validate1 = load(params.testPath + 'InputValidate1').u_validate1;
u_validate1 = randn(N,4);
u_validate2 = randn(N,4);

params = NewParameters();

save(params.testPath + 'InputValidate1','u_validate1');
save(params.testPath + 'InputValidate1','u_validate2');


maxStepSize = params.maxStepSize;
t_final =(length(u_validate1)-.01)*params.maxStepSize;
simin.t = 0:maxStepSize:t_final;
simin.u_validate=[simin.t',u_validate1];
simin.w=simin.u_validate;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% T4 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

params.setInitialStates(5); % Set phi 5 degrees
outOriginal = sim('NewTrainingData.slx');
% TotalStates_original = [outOriginal.x,outOriginal.eta,outOriginal.gamma];
TotalStates_original1 = [outOriginal.x];

outId = sim('NewValidation.slx');
% TotalStates_id = [outId.x_id,outId.eta_id,outId.gamma_id];
TotalStates_id1 = [outId.x_id];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% T5 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

params.setInitialStates(10); % Set phi 5 degrees
outOriginal = sim('NewTrainingData.slx');
% TotalStates_original = [outOriginal.x,outOriginal.eta,outOriginal.gamma];
TotalStates_original2 = [outOriginal.x];

outId = sim('NewValidation.slx');
% TotalStates_id = [outId.x_id,outId.eta_id,outId.gamma_id];
TotalStates_id2 = [outId.x_id];

plot_validation(TotalStates_original1, TotalStates_id1, t_final,"T4");
plot_validation(TotalStates_original2, TotalStates_id2, t_final,"T5");
