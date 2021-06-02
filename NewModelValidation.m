% Randn Normally distributed pseudorandom numbers.
% % Randn Normally distributed pseudorandom numbers.
N = 1E4;
% u_validate1 = randn(N,4);
params = NewParameters(5, 5);

u_validate1 = load(params.testPath + 'InputValidate1').u_validate1;
% save(params.testPath + 'InputValidate1','u_validate1');
maxStepSize = params.maxStepSize;
t_final =(length(u_validate1)-.01)*params.maxStepSize;
simin.t = 0:maxStepSize:t_final;
simin.u_validate=[simin.t',u_validate1];
simin.w=simin.u_validate;

outOriginal = sim('NewTrainingData.slx');
% TotalStates_original = [outOriginal.x,outOriginal.eta,outOriginal.gamma];
TotalStates_original = [outOriginal.x];

outId = sim('NewValidation.slx');
% TotalStates_id = [outId.x_id,outId.eta_id,outId.gamma_id];
TotalStates_id = [outId.x_id];

% plot_validation;
