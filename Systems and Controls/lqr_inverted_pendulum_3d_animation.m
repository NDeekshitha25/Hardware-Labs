clc;
clearvars;
close all;

% Parameters
m  = 0.2;
l_1 = 0.15;
l_2 = 0.2;
J_a = 0.005;
J_p = 0.002;
g  = 9.81;
k_t = 0.05;

den = (J_a+m*l_2^2)*(J_p+m*l_1^2)-m^2*l_1^2*l_2^2;

% State matrices
A = [0 1 0 0;
     0 0 (m^2*l_1^2*l_2*g)/den 0;
     0 0 0 1;
     0 0 ((J_a+m*l_2^2)*(m*g*l_1))/den 0];

B = [0;
     k_t*(J_p+m*l_1^2)/den; 
     0; 
     m*l_2*l_1*k_t/den];

C = eye(4);

% Cost matrices
Q = eye(4);
R = 1;

%% ================= LQR via Hamiltonian =================

R_inv = inv(R);

H = [ A,           -B*R_inv*B';
     -Q,           -A'];

[V, D] = eig(H);
eig_H = diag(D);

% Stable eigenvalues
idx = real(eig_H) < 0;
V_stable = V(:, idx);

n = size(A,1);
V1 = V_stable(1:n,:);
V2 = V_stable(n+1:end,:);

% Riccati solution
P = real(V2 / V1);
P = (P + P')/2;

% Gain
K = R_inv * B' * P;

disp('Gain K : ')
disp(K)

A_cl = A - B*K;

% Stability check
disp('Closed-loop eigenvalues:')
disp(eig(A_cl))

%% ================= Simulation =================

T = 0.01;
tspan = 0:T:10;

% Slight disturbance (better for animation)
x0 = [0.1; 0; 0.05; 0];

[t,x] = ode45(@(t,x) A_cl*x, tspan, x0);

%% ================= Animation =================

figure;
axis equal;
grid on;
view(3);
hold on;

xlim([-0.35 0.35]);
ylim([-0.35 0.35]);
zlim([-0.35 0.35]);

xlabel('X');
ylabel('Y');
zlabel('Z');
title('Inverted Pendulum (LQR Stabilization)');

arm_line  = line([0 0],[0 0],[0 0],'LineWidth',3);
pend_line = line([0 0],[0 0],[0 0],'LineWidth',2,'Color','r');

% Optional: trajectory of pendulum tip
trail = plot3(nan,nan,nan,'k:');

for i = 1:length(t)
    
    theta = x(i,1);
    phi   = x(i,3);
    
    % Arm end
    xa = l_2*cos(theta);
    ya = -l_2*sin(theta);
    za = 0;
    
    % Pendulum end
    xp = xa + l_1*sin(phi)*sin(theta);
    yp = ya + l_1*sin(phi)*cos(theta);
    zp = l_1*cos(phi);
    
    % Update arm
    set(arm_line,  'XData',[0 xa], 'YData',[0 ya], 'ZData',[0 za]);
    
    % Update pendulum
    set(pend_line, 'XData',[xa xp],'YData',[ya yp],'ZData',[za zp]);
    
    % Update trail
    oldX = get(trail,'XData');
    oldY = get(trail,'YData');
    oldZ = get(trail,'ZData');
    
    set(trail,'XData',[oldX xp],...
              'YData',[oldY yp],...
              'ZData',[oldZ zp]);
    
    drawnow;
    pause(0.01);
end
