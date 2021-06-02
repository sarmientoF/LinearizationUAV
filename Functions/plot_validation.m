%% Plot Id and Original Data
function plot_validation(TotalStates_id, TotalStates_original, t_final, name)

    
figure()
% TotalStates_original = [ans.x,ans.eta,ans.gamma];
% TotalStates_id = [ans.x_id,ans.eta_id,ans.gamma_id];
subplot(1,2,1)
t_span = linspace(0,t_final,length(TotalStates_id));

LW=2;
plot(t_span,TotalStates_id,'LineWidth',LW)
    xlabel('Times[s]','interpreter','latex')
    ylabel('states $x_{id}$','interpreter','latex')
    % legend('$x$','$v^{\prime}$','$\eta=xv^{\prime}$','$\gamma=x^2$','interpreter','latex')
    legend('$x1$','$x2$','$x3$', ...
            '$v^{\prime}1$', '$v^{\prime}2$','$v^{\prime}3$', ...
            '$\varepsilon_1$','$\varepsilon_2$','$\varepsilon_3$', ...
            '$\eta$', ...
            '$\omega_1$', '$\omega_2$', '$\omega_3$', ...
            '$T$',...
            'interpreter','latex', 'Location','northwest')
    ax = gca;
    ax.FontSize = 25;
    ax.FontName='Times New Roman';
    grid on
    title(['Identified Trajectories ', name, '_{id}'])


subplot(1,2,2)
plot(t_span,TotalStates_original,'LineWidth',LW)
    xlabel('Times[s]','interpreter','latex')
    ylabel('states $x_{data}$','interpreter','latex')
%     legend('$x$','$v^{\prime}$','$\eta=xv^{\prime}$','$\gamma=x^2$','interpreter','latex')
    legend('$x1$','$x2$','$x3$', ...
    '$v^{\prime}1$', '$v^{\prime}2$','$v^{\prime}3$', ...
    '$\varepsilon_1$','$\varepsilon_2$','$\varepsilon_3$', ...
    '$\eta$', ...
    '$\omega_1$', '$\omega_2$', '$\omega_3$', ...
    '$T$',...
    'interpreter','latex', 'Location','northwest')
    ax = gca;
    ax.FontSize = 25;
    ax.FontName='Times New Roman';
    grid on
    title(['Original Trajectories ', name])
    
error = TotalStates_original-TotalStates_id;

figure()
title([name ": Error"])
plot(t_span,error,'LineWidth',LW)
    xlabel('Times[s]','interpreter','latex')
%     ylabel('states $x_{data}$','interpreter','latex')
%     legend('$x$','$v^{\prime}$','$\eta=xv^{\prime}$','$\gamma=x^2$','interpreter','latex')
    legend('$x1$','$x2$','$x3$', ...
    '$v^{\prime}1$', '$v^{\prime}2$','$v^{\prime}3$', ...
    '$\varepsilon_1$','$\varepsilon_2$','$\varepsilon_3$', ...
    '$\eta$', ...
    '$\omega_1$', '$\omega_2$', '$\omega_3$', ...
    '$T$',...
    'interpreter','latex', 'Location','northwest')    
    ax = gca;
    ax.FontSize = 25;
    ax.FontName='Times New Roman';
    grid on
    title(['Error ', name])

end
