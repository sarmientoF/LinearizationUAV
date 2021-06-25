function plotOutputs(X, X_d, t, mVer)

    figure()
    plot(t,X(:, 1:3),'LineWidth',2)
    hold on
    plot(t,X_d(:, 1:3), '--','LineWidth',2)
    xlabel('Times[s]','interpreter','latex')
    ylabel('states $x_{id}$','interpreter','latex')
    legend('$x1$','$x2$','$x3$', ...
           '$x_{1d}$','$x_{2d}$','$x_{3d}$', ...
            'interpreter','latex', 'Location','northeast');
    ax = gca;
    ax.FontSize = 25;
    ax.FontName='Times New Roman';
    grid on
    grid minor

    title(['Postion'])
    saveas(gcf, ['Postion_' mVer '.jpg'])

    figure()
    plot(t,X(:, 4:6),'LineWidth',2)
    hold on
    plot(t,X_d(:, 4:6), '--','LineWidth',2)
    xlabel('Times[s]','interpreter','latex')
    ylabel('states $x_{id}$','interpreter','latex')
    legend('$v1$','$v2$','$v3$', ...
           '$v{1d}$','$v{2d}$','$v{3d}$', ...
            'interpreter','latex', 'Location','southeast');
    ax = gca;
    ax.FontSize = 25;
    ax.FontName='Times New Roman';
    grid on
    grid minor

    title(['Velocity'])
    saveas(gcf, ['Velocity_' mVer '.jpg'])

    figure()
    plot(t,X(:, 7:10),'LineWidth',2)
    hold on
    plot(t,X_d(:, 7:10), '--','LineWidth',2)
    xlabel('Times[s]','interpreter','latex')
    ylabel('states $x_{id}$','interpreter','latex')
    legend('$\varepsilon_1$','$\varepsilon_2$','$\varepsilon_3$', '$\eta$', ...
           '$\varepsilon_{1d}$','$\varepsilon_{2d}$','$\varepsilon_{3d}$', '$\eta_d$',...
            'interpreter','latex', 'Location','northeast');
    ax = gca;
    ax.FontSize = 25;
    ax.FontName='Times New Roman';
    grid on
    grid minor

    title(['Euler'])
    saveas(gcf, ['Euler_' mVer '.jpg'])

    figure()
    plot(t,X(:, 11:13),'LineWidth',2)
    hold on
    plot(t,X_d(:, 11:13), '--','LineWidth',2)
    xlabel('Times[s]','interpreter','latex')
    ylabel('states $x_{id}$','interpreter','latex')
    legend('$\omega_1$', '$\omega_2$', '$\omega_3$', ...
           '$\omega_{1d}$', '$\omega_{2d}$', '$\omega_{3d}$', ...
            'interpreter','latex', 'Location','northeast');
    ax = gca;
    ax.FontSize = 25;
    ax.FontName='Times New Roman';
    grid on
    grid minor

    title(['Angular Velocity'])
    saveas(gcf, ['Angular_Velociy_' mVer '.jpg'])

    figure()
    plot(t,X(:, 14),'LineWidth',2)
    hold on
    plot(t,X_d(:, 14), '--','LineWidth',2)
    xlabel('Times[s]','interpreter','latex')
    ylabel('states $x_{id}$','interpreter','latex')
    legend('$T$', ...
           '$T_d$', ...
            'interpreter','latex', 'Location','southeast');
    ax = gca;
    ax.FontSize = 25;
    ax.FontName='Times New Roman';
    grid on
    grid minor

    title(['Thrust'])
    saveas(gcf, ['Thrust_' mVer '.jpg'])

    figure()
    plot(t,X(:, 15:18),'LineWidth',2)
    hold on
    plot(t,X_d(:, 15:18), '--','LineWidth',2)
    xlabel('Times[s]','interpreter','latex')
    ylabel('states $x_{id}$','interpreter','latex')
    legend('$w_1$', '$w_2$','$w_3$','$w4$',...
           '$w_{1d}$', '$w_{2d}$','$w_{3d}$','$w{4d}$',...
            'interpreter','latex', 'Location','southeast');
    ax = gca;
    ax.FontSize = 25;
    ax.FontName='Times New Roman';
    grid on
    grid minor

    title(['Inputs'])
    saveas(gcf, ['Inputs_' mVer '.jpg'])
end