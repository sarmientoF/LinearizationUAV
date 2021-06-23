clc, clear, close all;
%% Create the 3 sets of training data
%  1. Training Input
% Randn Normally distributed pseudorandom numbers.
N = 5E4;
params = Parameters();

trainigPath = params.trainigPath;
fprintf("🚀 Start Generating InputUAV data\n")

w1 = randn(N,4);
save(trainigPath + 'InputUAV1','w1');

w2 = randn(N,4);
save(trainigPath + 'InputUAV2','w2');

w3 = randn(N,4);

save(trainigPath + 'InputUAV3','w3');   
fprintf("✅ Done Generating InputUAV data\n")


% 2. Generate Outputs for several angles
angles = [5 15 20];

for i = 1: length(angles)
    fprintf("🚀 Generating OutputUAV" + i + "data\n")
    
    inputUAV = load(params.trainigPath + "InputUAV" + i);
    w = getfield(inputUAV, "w" + i);

    t_final =(length(w)-.01)* params.maxStepSize;
    simin.t = 0:params.maxStepSize:t_final;

    simin.w=[simin.t',w];

    params.setInitialStates(angles(i));
    
    out = sim('TrainingData.slx');
    
    x = out.x';
    w = out.w';
    eta = out.eta';
    gamma = out.gamma';
    d_eta = out.d_eta';
    d_gamma = out.d_gamma';
    
    save(params.trainigPath +'OutputUAV' + i,'x', 'w', 'eta', 'gamma', 'd_eta', 'd_gamma');

    fprintf("✅ Done OutputUAV" + i + "data\n")

end
