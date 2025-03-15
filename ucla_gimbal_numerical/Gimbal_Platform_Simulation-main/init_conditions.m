% ====== constants ======
g = 9.81;
m_main = 0.012; % mass of main frame
m_qc = 0.03; % mass of qc 
m = (m_qc+0.006)*4 + m_main; %total mass 0.036*4 + 0.012;
Lw = 0.185; % from system center to qc center
IBxy = 2*0.036*Lw^2; % inertia in x and y direction 2*0.036*Lw^2 + 3e-5
IBz = 4*0.036*Lw^2; % inertia in z direction 4*0.036*Lw^2 + 6e-5
IB = diag([IBxy, IBxy, IBz]);



Lh = [0;0;0]; % com offset
com_delay = 0.04; % communication delay
% frame_offset = [0.12 0.1 0.1]; % CoM offset of main frame case 1
% frame_offset = [0.06 0.06 0.05]; % case 2&3

fd0 = [0;0;m*g/4;0;0;m*g/4;0;0;m*g/4;0;0;m*g/4];

% ====== low level PID gains ======

pgaina = 5e-4;    
igaina = 3e-4;
dgaina = 2e-4;     

pgainb = 5e-4;
igainb = 3e-4;
dgainb = 2e-4;

% ======== trajectory combined =========

StepSize = 0.01;

% Apos = [0, -0, 0];
% Arpy = [-0, -pi/2, 0];
% tpos1 = [20, 11, 30];
% tpos2 = [100, 100, 100];
% trpy1 = [7, 15, 14];
% trpy2 = [4, 40, 9];
% wpos = 2*pi./tpos1*1/2;
% wrpy = 2*pi./trpy1*1/2;

% ======= grapper control gain =======
K1 = 800; 
a = 1;
% ======= rotation inetial of gripper =====%
Iz = 3*(10^-5);
B = 0;
K = 0;

% =======Define the S matrix =====%

