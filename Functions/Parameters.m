classdef Parameters < handle
    
    properties
        % Paths 
        trainigPath
        testPath
        % Initial States
        p_0
        v_0
        epsilon_0
        eta_e0
        euler_0
        omega_0
        T_0
        d
        x_0Taylor
        % Simulation settings
        ST_id
        ST_LQR
        maxStepSize
        
        % Dim
        dim_x
        dim_u
        dim_eta
        dim_gamma
        dim_xi

        %
        eta_0
        gamma_0
    end
    
    methods
        % CONSTRUCTOR   
        function this = Parameters(phi)
            if nargin < 1
                phi = 0;
            end
            
            this.setPaths()
            this.setInitialStates(phi)
            this.setSimulationSettings()
            this.setDim()
            [this.eta_0,this.gamma_0] = EtaGammaIni(this.T_0,this.euler_0, this.omega_0,this.d);

        end

        function setPaths(this)
            %% Path Parameters
            this.trainigPath = "Data/Training/";
            this.testPath = "Data/Test/";
        end

        function setInitialStates(this, phi)
            this.p_0 = 20*[0;0.2;0.3]; %Position
            this.v_0 = 0*[0.5;0;0.2]; %Velocity

            this.epsilon_0 = [0;0;sind(phi)]; %Euler parametes
            this.eta_e0 = cosd(phi); %Euler parametes(angle of rotation)
            this.euler_0 = [this.epsilon_0; this.eta_e0];
            this.omega_0 = 0 * [1; 1; 1];
            this.T_0 = 9.81; %Total Thrust
            this.d = 0; %Shift origin

            this.x_0Taylor = [this.p_0;
                            this.v_0;
                            this.epsilon_0;
                            this.eta_e0;
                            this.omega_0;
                            this.T_0];
        end

        function setSimulationSettings(this)
           % Simulation setting
           this.ST_id = 0.001; %Sampling Time for Zero Order Hold in Identification
           this.ST_LQR = 0.001; %Sampling Time for Zero Order Hold in LQR
           this.maxStepSize = 0.001;

        end

        function setDim(this)
            this.dim_x = 14;
            this.dim_u = 4;
            this.dim_eta = 18;
            this.dim_gamma = 6;
            this.dim_xi = this.dim_x+this.dim_u+this.dim_eta+this.dim_gamma;

        end
 
    end
    
end

