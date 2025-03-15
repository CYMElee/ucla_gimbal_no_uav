
%% xyz position using ground truth 
tt = abs_pos.Time;

figure;
plot(tt, abs_pos.data(:,1), 'r-', 'LineWidth', 1); hold on; grid on;
plot(tt, abs_pos.data(:,2), 'g-', 'LineWidth', 1); 
plot(tt, abs_pos.data(:,3), 'b-', 'LineWidth', 1); 

plot(tt, pr.data(:,1), 'r:', 'LineWidth', 1);
plot(tt, pr.data(:,2), 'g:', 'LineWidth', 1);
plot(tt, pr.data(:,3), 'b:', 'LineWidth', 1);

legend('x','y','z','x_d_e_s_i_r_e_d','y_d_e_s_i_r_e_d','z_d_e_s_i_r_e_d','Location','SouthEast');
xlabel('Simulation time, t [s]'); ylabel('COM XYZ Positions [m]');
title('XYZ Position of COM Frame \{W\}');
% axis([0,60,-2.5,2.5]);
% axis([0,15,-0.2,0.2]);
%% xyz position error
tt = abs_pos.Time;
figure;
pos_error_x = (pr.data(:,1)-abs_pos.data(:,1))*100;
pos_error_y = (pr.data(:,2)-abs_pos.data(:,2))*100;
pos_error_z = (pr.data(:,3)-abs_pos.data(:,3))*100;
plot(tt, pos_error_x, 'r-', 'LineWidth', 1); hold on; grid on;
plot(tt, pos_error_y, 'g-', 'LineWidth', 1); 
plot(tt, pos_error_z, 'b-', 'LineWidth', 1); 
legend('x_error','y_error','z_error','Location','SouthEast');
xlabel('Simulation time, t [s]'); ylabel('COM XYZ Positions error [cm]');
title('XYZ Position error of COM Frame \{W\}');
ylim([-3 3]);

hold off;



%% position error using ground truth 


%% ZYX euler angle
tt = abs_ypr.Time;
r1 = abs_ypr.Data;

figure;
plot(tt,r1(:,3),'r-', 'LineWidth', 1); hold on; grid on;
plot(tt,r1(:,2),'g-', 'LineWidth', 1);
plot(tt,r1(:,1),'b-', 'LineWidth', 1);
plot(tt,rotr.Data(:,1),'r:', 'LineWidth', 1); 
plot(tt,rotr.Data(:,2),'g:', 'LineWidth', 1);
plot(tt,rotr.Data(:,3),'b:', 'LineWidth', 1);
legend('Xrot','Yrot','Zrot','Xrot_d','Yrot_d','Zrot_d','Location','SouthWest');
title('XYZ Angle of COM Frame \{W\}');
xlabel('Simulation time, t [s]'); ylabel('Body Euler Angles [rad]');
% axis([0,15,-0.05,0.05]);

%% angle error
tt = eR.Time;
figure;

plot(tt, -eR.Data(:,1),'r'); hold on; grid on;
plot(tt, -eR.Data(:,2),'g');
plot(tt, -eR.Data(:,3),'b');
xlabel('Simulation time, t [s]'); ylabel('angle rad');
legend('x','y','z','Location','SouthEast');
title('eR');
%axis([0,60,-200,200]);
% tt = rpyR.Time;
% subplot(212)
% plot(tt, rpyR.Data(:,1),'r'); hold on; grid on;
% plot(tt, rpyR.Data(:,2),'g');
% plot(tt, rpyR.Data(:,3),'b');
% xlabel('Simulation time, t [s]'); ylabel('angle rad');
% legend('x','y','z','Location','SouthEast');
% title('rpyR');

%% input from control u1 u2

tt = u1.Time;
figure;
subplot(211)
plot(tt, u1.Data(:,1),'r'); hold on; grid on;
plot(tt, u1.Data(:,2),'g');
plot(tt, u1.Data(:,3),'b');
xlabel('Simulation time, t [s]'); ylabel('Force [N]');
legend('x','y','z','Location','SouthEast');
title('input from position control u1');
% axis([0,60,-200,200]);

subplot(212)
plot(tt, u2.Data(:,1),'r'); hold on; grid on;
plot(tt, u2.Data(:,2),'g');
plot(tt, u2.Data(:,3),'b');
xlabel('Simulation time, t [s]'); ylabel('Torque [Nm]');
legend('x','y','z','Location','SouthEast');
title('input from angle control u2');
% axis([0,60,-1.6,1.6]);

%% F thrust

tt = F.Time;
figure;
plot(tt, F.Data(:,1),'r'); hold on; grid on;
plot(tt, F.Data(:,2),'g');
plot(tt, F.Data(:,3),'b');
plot(tt, F.Data(:,4),'m');
xlabel('Simulation time, t [s]'); ylabel('thrust [N]');
title('thrust command');
axis([0, 30, 0, 0.6]);

%% alpha and beta
tt = alpha.Time;
tstart = 1; tend = size(alpha_d.Data,1); %5001;

figure;
for i=1:4
    sp = 410+i;
    subplot(sp)
    plot(tt(tstart:tend), alpha_d.Data(tstart:tend,i));
    hold on;
    plot(tt(tstart:tend), alpha.Data(tstart:tend,i),'k','LineWidth',1);
    grid on;
    legend(['alpha',num2str(i),'-d'],['alpha',num2str(i)],'Location','NorthWest');
    if i==1 || i==3
        axis([tt(tstart),tt(tend),-0.6,0.6]);
    else
        axis([tt(tstart),tt(tend),-2.3,2.3]);
    end
end

figure;
for i=1:4
    sp = 410+i;
    subplot(sp)
    plot(tt(tstart:tend), beta_d.Data(tstart:tend,i));
    hold on;
    plot(tt(tstart:tend), beta.Data(tstart:tend,i),'k','LineWidth',1);
    grid on;
    legend(['beta',num2str(i),'-d'],['beta',num2str(i)],'Location','NorthWest');
    axis([tt(tstart),tt(tend),-2.5,2.5]);
    if i==2 || i==4
        axis([tt(tstart),tt(tend),-0.4,0.4]);
    else
        axis([tt(tstart),tt(tend),-2.3,2.3]);
    end
end

%% motor command
figure;
for i=1:4
    for j=1:4
        subplot(4, 4, 4*i-3+j-1)
        plot(motor_com.Time, motor_com.Data(:,4*i-3+j-1)); hold on;
        plot([0,motor_com.Time(end)],[0,0],'r'); plot([0,motor_com.Time(end)],[0.14715,0.14715],'r');
        xlabel(['qc ',num2str(i-1),' propeller ',num2str(j-1)]);
        
        axis([0,motor_com.Time(end),-0.01,0.16]);
        grid on;
        
    end
end

%% tau alpha and beta
figure;
for i=1:4
    subplot(4,2,2*i-1)
    plot(tau_alpha.Time, tau_alpha.Data(:,i));
    xlabel(['qc ',num2str(i-1), ' tau alpha']);
    axis([0,tau_alpha.Time(end),-0.005,0.005]);
    grid on;
    subplot(4,2,2*i)
    plot(tau_beta.Time, tau_beta.Data(:,i));
    xlabel(['qc ',num2str(i-1), 'tau beta']);
    axis([0,tau_alpha.Time(end),-0.005,0.005]);
    grid on;
    
end


%% R3x3

figure;
subplot(331);
plot(R3x3.Time,squeeze(R3x3.Data(1,1,:)));
subplot(332);
plot(R3x3.Time,squeeze(R3x3.Data(1,2,:)));
subplot(333);
plot(R3x3.Time,squeeze(R3x3.Data(1,3,:)));
subplot(334);
plot(R3x3.Time,squeeze(R3x3.Data(2,1,:)));
subplot(335);
plot(R3x3.Time,squeeze(R3x3.Data(2,2,:)));
subplot(336);
plot(R3x3.Time,squeeze(R3x3.Data(2,3,:)));
subplot(337);
plot(R3x3.Time,squeeze(R3x3.Data(3,1,:)));
subplot(338);
plot(R3x3.Time,squeeze(R3x3.Data(3,2,:)));
subplot(339);
plot(R3x3.Time,squeeze(R3x3.Data(3,3,:)));

% ==== plot trajectory ======%
figure;

plot3(pr.data(:,1),pr.data(:,2),pr.data(:,3),'b--','LineWidth',1); hold on; grid on;

plot3(pos.data(:,1),pos.data(:,2),pos.data(:,3),'r-','LineWidth',0.5); 
xlabel('x(m)','FontSize',15);
ylabel('y(m)','FontSize',15);
zlabel('z(m)','FontSize',15);
hold off ;
legend('desire','sensing');
title('XYZ Trajectory');

