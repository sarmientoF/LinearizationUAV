GenerateTrainigInput; %% Keep comented not to modify the Data folder

SystemIdentification; %% Generated A, B Matrixes

% %% Controller or Model Validation

if(Rank_control == 38 && norm(detS) > 1e-8)
    % LQRCtrl
    sound(1.5 * sin(10 * 1:1e4));
    ServoCtrl;

else
    pause(1)
    main2
end