% Randn Normally distributed pseudorandom numbers.
% % Randn Normally distributed pseudorandom numbers.
fprintf("🚨 Model Validation\n")
N = 1E4;
% u_validate1 = load(params.testPath + 'InputValidate1').u_validate1;

fprintf("🚀 Start Creating Validation Data\n")
u_validate1 = randn(N,4);
u_validate2 = randn(N,4);

params = Parameters();

save(params.testPath + 'InputValidate1','u_validate1');
save(params.testPath + 'InputValidate1','u_validate2');
fprintf("✅ Done CreatingValidation Data\n")


maxStepSize = params.maxStepSize;
t_final =(length(u_validate1)-.01)*params.maxStepSize;
simin.t = 0:maxStepSize:t_final;
simin.u_validate=[simin.t',u_validate1];
simin.w=simin.u_validate;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% T4 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf("🚀 Start Validation for T4 data\n")

params.setInitialStates(5); % Set phi 5 degrees
outOriginal = sim('TrainingData.slx');
% TotalStates_original = [outOriginal.x,outOriginal.eta,outOriginal.gamma];
TotalStates_original1 = [outOriginal.x];

outId = sim('Validation.slx');
% TotalStates_id = [outId.x_id,outId.eta_id,outId.gamma_id];
TotalStates_id1 = [outId.x_id];
fprintf("✨ Validation for T4 data finished\n")

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% T5 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf("🚀 Start Validation for T5 data\n")

params.setInitialStates(10); % Set phi 5 degrees
outOriginal = sim('TrainingData.slx');
% TotalStates_original = [outOriginal.x,outOriginal.eta,outOriginal.gamma];
TotalStates_original2 = [outOriginal.x];

outId = sim('Validation.slx');
% TotalStates_id = [outId.x_id,outId.eta_id,outId.gamma_id];
TotalStates_id2 = [outId.x_id];
fprintf("✨ Validation for T5 data finished\n")

fprintf("🗺 Start Ploting\n")

close all
plot_validation(TotalStates_original1, TotalStates_id1, t_final,"T4");
plot_validation(TotalStates_original2, TotalStates_id2, t_final,"T5");
