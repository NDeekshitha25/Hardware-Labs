clc;
clear vars;
close all;

%State equations
% x. ̇(t) = Ax(t) + Bu(t)
% y(t) = Cx(t)

%Matrix A
A = [-1.213213255856908  -0.052699540857194   0.114452537819400  -0.458503457153880  -0.147596519643947   0.330216171993562  -0.216306142694950   0.108524691675982  -0.277136364174417   0.213306124705031 -0.234400418544842  -0.694904339299891  -0.372985044024789  -0.121052395899524;
   -0.445138204194362  -1.087338372330932   0.506316210864373   0.420119557543333   0.489063639965910  -0.265671000243473  -0.336650153174219  -0.266447453528354   0.326773051102463  -0.796414105574600   -0.152486416125726  -0.360052673382867  -0.509891627577762   0.880961088466860;
   0.484525786600994   0.174803353899379  -0.108630387296726  -0.147473032367577  -0.370609448513368   0.123445036090085  -0.391828220999852   0.432403506843010   0.040561080322674   1.548617577592084   -0.375626137358579  -0.964927403783107   0.116685942887537   0.195907069263956;
  -0.628653100827204   0.441686129222833  -0.196853639475424  -0.740518371993041  -0.203043754424680  -0.312951739221684   0.459277316310521  -1.144480648269924  -0.227661184417581   0.621646540385829    0.773529276032394  -0.824173422452114  -0.511336138546041  -0.143886170459940;
  -0.526879261134897   0.496721354898758  -0.789140781845308  -0.351413813417401  -1.781412350680168   0.300097072779868   0.361009179150026   0.821998420305273   0.197670222666982   0.103894550459810   -0.518715568276280   0.458711846080412  -0.050433972884675   0.017439085643547;
  -0.162938036835619   0.115227089326697   0.230518490031468   0.226985493452003  -0.147401905420421  -1.073949490350060   0.492057044397738   0.809216490217785  -0.106022553236031  -0.200408629363208    0.219266594012242  -1.284874915967967  -0.219452186333267   0.086424084364871;
  -0.937922024260352   0.295340626262125   0.081848014134194   0.702150763890030   0.460918049982761  -0.410290741684858  -1.656970404290512   0.515521785489352   0.039634647589333   0.551677571844913    0.910747253955778  -0.502106754099405  -1.258898348872255   0.174292978828746;
   0.727293350401215  -0.399923820740790   0.252644270324252  -1.022331509304516   0.714779970671842   0.160297998212142  -0.683617227260968  -0.862980196841881  -0.434983508111977  -0.749659627595721   -0.848332491977190  -0.073701377614643   0.047794275307910  -0.291037548459371;
  -0.883478418688157   0.807423337770903  -0.272683699489586   0.267422703430696  -0.335917976087635  -0.355488407278101   1.117546803497625   0.475823305013847  -1.343243368591083   1.216242923480291   -0.117171815598981  -0.380364549164507  -0.827852126523950   0.367288610907304;
  -0.432084382768220  -0.208121861637220   1.692305102882171   0.996853318049892  -0.253373736345148  -1.076336539502446   0.349952751653385   0.243525258046507   0.467699882747476  -0.138850036162691    0.058652839684074  -0.660320581520629   0.238591279631722  -0.021125539243573;
  -0.162352919624227  -0.976155299865440  -0.243225326820792   0.836239633325489  -0.433802463517382   0.411365862850318   0.130321781352260  -0.897920092095636  -0.228424553357463  -0.568131183985648   -0.593732855151864  -0.725643142274004   0.182526229046144  -0.147385751504529;
  -0.264370906345628  -0.184742644441694  -1.003940450295694  -0.848369091986984   0.494546791639666  -1.104312423847451  -0.472200324956500  -0.339323185019347  -0.108101954544411  -0.430160178902030   -0.930981520180108   0.321055052198516   0.688882757485099  -0.611757590647088;
   0.575439200692222  -1.267310249593962  -0.215460248084041  -0.312938157224291   0.021629740368688   0.430071077232889  -1.163510493607768  -0.659695990919597  -0.382659856177330   0.430530215423247   -0.196984819655413   0.942614992066365  -0.194564541005406  -0.908760104887207;
  -0.214375145115562   0.987648714149219   0.442806720234774  -0.081107514151397  -0.216286104227307  -0.199881487887741   0.281210418831350  -0.068571314905706   0.190937766594154  -0.003347907463792   -0.101054426075363  -0.641224659163822  -1.242848391866568  -1.725651421647249];

%Matrix B
B= [ -0.051723763561734  -0.305270449184583  -0.015315868248594;
  -0.116732420024660  -0.475945089926195   0.149955878770381;
  -0.112898591360926  -0.041230352019466  -0.257329596734228;
   0.450703580365998  -0.195616995582868   0.021668047239566;
  -0.175175023018630  -0.164833619607650   0.126111050083874;
   0.193325591568345  -0.201825450079648   0.001812952706111;
  -0.746946115214500  -0.888561633091335  -0.534882101127978;
   0.118896143573814   0.003278035071589   0.438395454885899;
  -0.834413562808927  -0.496999682104461  -0.647097984062711;
  -0.486371252402602  -0.307207657585152  -0.536947426548773;
   0.293031461319545   0.647280729575534  -0.241442432395560;
   0.281522419773345   0.703605033443511   0.496061513668761;
   0.401731276643778   0.718304876069954   0.425248352781694;
  -0.207634639546252  -0.326879707471223  -0.260613735300743];

%Matrix C
C =[0.695053806816924  -0.653901035211257  -0.216669043964540  -0.406643748943393  -0.337496928708196   0.800344919841996  -0.734680898447967  -0.383177337555783  -0.062081713564930  -0.164440009729601  -0.052596268307648   0.283621895206324   0.826159797514201  -0.281394936691068;
   0.170497399997020  -0.095533189106804  -0.211894215368707  -0.103936550394383  -0.119769092888598   0.354854849584245  -0.625481232333294  -0.485883175434064   0.198880592962716  -0.214578324733530    0.086360044518748   0.383477729131322   0.209925692065307   0.087002975029789];

%% (i)
%Checking Stability of matrix A
eig_vals = eig(A);

if all(real(eig_vals) < 0)
    disp('Matrix A is stable');
elseif any(real(eig_vals) > 0)
    disp('Matrix A is unstable');
else
    disp('Matrix A is marginally stable');
end


t_span = linspace(0, 15, 400); 
n_ic = 1; 
Y_traj = cell(n_ic, 1); 

%solving the system for diff inputs
for i = 1 : n_ic
    x0 = zeros(14, 1);
    x0(1) = 1;

    [t , x] = ode45(@(t, x) A*x , t_span, x0);

    y = (C * x')';
    Y_traj{i} = real(y); % Forcing strict reality
end

% Animated Phase potrait
figure;
hold on;
grid on;
xlabel('y1');
ylabel('y2');
title('Phase Portrait (Zero Input)');

colors = lines(max(n_ic, 2)); 
n_frames = min(cellfun(@(y) size(y,1), Y_traj));

for k = 1:5:n_frames 
    cla;
    hold on;

    for i = 1:n_ic
        y = Y_traj{i};
        plot(y(1:k,1), y(1:k,2), 'Color', colors(i,:));
        plot(y(k,1), y(k,2), 'o', 'Color', colors(i,:));
    end
    pause(0.01);
end

%%
%part (ii)
%Checking stabilizability using PBH test.
n = size(A, 1);
is_stabilizable = true;
for i = 1 : length(eig_vals)
    lambda = eig_vals(i);
    if (real(lambda) >= 0)
        PBH = [A - lambda*eye(14) , B];
        r = rank(PBH); 
        if(r < n )
            is_stabilizable = false;
        end
    end
end

if(is_stabilizable)
    disp("Sytem is Stabilizable");
else 
    disp("System is non Stabilizable");
end

%%
%part (iii)
%Checking Detectability using PBH test.
n = size(A, 1);
is_detectable = true;
for i = 1 : length(eig_vals)
    lambda = eig_vals(i);
    if (real(lambda) >= 0)
        PBH = [A - lambda*eye(14) ; C];
        r = rank(PBH); 
        if(r < n )
            is_detectable = false;
        end
    end
end

if(is_detectable)
    disp("Sytem is Detectable");
else 
    disp("System is non Detectable");
end

%%
%part (iv) - Kalman Decomposition
Co = [];
Ob = [];
for i = 0:n-1
    Co = [Co,  A^i * B];
    Ob = [Ob;  C * A^i];
end

r_c = rank(Co);    
r_o = rank(Ob);    

V_c  = Gram_Schmidt(Co,r_c);   
V_uc = Gram_Schmidt(compute_null(Co'),n - r_c);   
V_o  = Gram_Schmidt(Ob',r_o);   
V_uo = Gram_Schmidt(compute_null(Ob),n - r_o);   

[v_co,   d_co  ] = zassenhaus(V_c',  V_o' );
[v_cno,  d_cno ] = zassenhaus(V_c',  V_uo');
[v_nco,  d_nco ] = zassenhaus(V_uc', V_o' );
[v_ncno, d_ncno] = zassenhaus(V_uc', V_uo');

T = [v_cno', v_co', v_ncno', v_nco'];

% Force strict reality on the transformation matrix
T = real(T);
if size(T, 2) < n
    T = [T,  real(null(T'))];
end

% Force exact real values dropping machine noise
A_bar = real(T \ A * T);
B_bar = real(T \ B);
C_bar = real(C * T);

row_col_co = d_cno + 1 : d_cno + d_co;   

A_co = A_bar(row_col_co, row_col_co);
B_co = B_bar(row_col_co, :);
C_co = C_bar(:, row_col_co);

fprintf('A_co \n'); disp(A_co);
fprintf('B_co \n'); disp(B_co);
fprintf('C_co \n'); disp(C_co);

%%
% part (V) - Reduced order luenberger observer
n_ob = size(A_co,1);
r_ob = size(C_co,1);

current = C_co;
Q_ob = [];

for i = 1:n_ob
    e = zeros(1,n_ob);
    e(i) = 1;

    candidate = [current; e];

    if rank(candidate) > size(current,1)
        Q_ob = [Q_ob; e];
        current = candidate;
    end

    if size(Q_ob,1) == n_ob-r_ob
        break;
    end
end

P_ob = [C_co; Q_ob];
T_ob = inv(P_ob);

A_bar_ob = P_ob*A_co*T_ob;
B_bar_ob = P_ob*B_co;

A12 = A_bar_ob(1:r_ob,r_ob+1:n_ob);
A22 = A_bar_ob(r_ob+1:n_ob,r_ob+1:n_ob);

mu = max(0,max(real(eig(A22')))) + 5;
sz = n_ob-r_ob;

A_d = A22';
B_d = A12';

A_lyap = -mu*eye(sz) - A_d;
Q_lyap = -B_d*B_d';

% Restored built-in 'lyap' function
W = lyap(A_lyap, Q_lyap); 

L = (0.5*A12*(W\eye(sz)))';
A_cl_obs = A22 - L*A12;
poles = eig(A_cl_obs);

disp('Observer Gain L = ')
disp(L)
disp('Observer poles = ')
disp(poles)
disp('W positive definite = ')
disp(all(eig(W) > 0))

%%
% part (VI) - Infinite Horizon LQR and Hamiltonian Eigen decomposition
Q = C_co' * C_co;        
R = eye(size(B_co, 2));  

n_co = size(A_co, 1);
m    = size(B_co, 2);

eig_Q = eig(Q);
eig_R = eig(R);
if all(eig_Q >= -1e-10)
    fprintf('Q is PSD\n');
else
    fprintf('Q is not PSD\n');
end
if all(eig_R > 0)
    fprintf('R is PSD\n\n');
else
    fprintf('R is not PSD\n\n');
end

R_inv = inv(R);
BR_Bt = B_co * R_inv * B_co';   

H = [ A_co,    -BR_Bt;
     -Q,       -A_co'];

[V_h, D_h] = eig(H);
eig_H = diag(D_h);

stable_idx = real(eig_H) < -1e-10;
V_stable = V_h(:, stable_idx);   

V1 = V_stable(1:n_co,     :);    
V2 = V_stable(n_co+1:end, :);    

P = real(V2 / V1);
P = (P + P') / 2;
fprintf('Matrix P %d*%d\n', size(P,1), size(P,2));
disp(P);

K = R_inv * B_co' * P;
fprintf('\nLQR Gain K (%dx%d):\n', size(K,1), size(K,2));
disp(K);

A_cl = A_co - B_co * K;
eig_cl = eig(A_cl);
if all(real(eig_cl) < 0)
    fprintf('Real(eig(A_cl)) are <0, hence this closed loop system is Stable\n');
else
    fprintf('Real(eig(A_cl)) are >0, closed loop system is not Stable\n');
end

%% part (VII) - Closed Loop Autonomous System & y-Phase Portrait


tspan = linspace(0, 15, 400); 
n_ic = 10;
traj = cell(n_ic,1);

for i = 1:n_ic
    x0 = zeros(size(A_cl,1),1);

    ang = 2*pi*(i-1)/n_ic;
    rad = 22 + 12*i;

    x0(1) = rad*cos(ang);
    x0(2) = 0.90*rad*sin(ang);

    if length(x0) > 2
        x0(3:end) = 0.02*randn(length(x0)-2,1);
    end

    [t,x] = ode45(@(t,x) A_cl*x , tspan , x0);

    y = (C_co*x')';
    y(:,1) = y(:,1)/7.8;     
    y(:,2) = y(:,2)/7.5;     

    traj{i} = real(y); 
end

min_len = min(cellfun(@(x) size(x,1), traj));


allY = cell2mat(traj);

xmin = min(allY(:,1));
xmax = max(allY(:,1));
ymin = min(allY(:,2));
ymax = max(allY(:,2));

mx = 0.08*(xmax-xmin);
my = 0.08*(ymax-ymin);

%% plot
figure;
hold on;
grid on;

xlabel('y_1');
ylabel('y_2');
title('CLOSED LOOP --- y phase portrait (LQR+Observer)');

colors = lines(n_ic); 

for k = 8:3:min_len 

    cla;
    hold on;
    grid on;

    for i = 1:n_ic
        y = traj{i};
        plot(y(1:k,1), y(1:k,2), 'Color', colors(i,:), 'LineWidth',1.6);
        plot(y(k,1), y(k,2), 'o', 'Color', colors(i,:), 'MarkerFaceColor', colors(i,:), 'MarkerSize',5);
    end

    plot(0,0,'ko','MarkerFaceColor','k','MarkerSize',8);
    xlim([xmin-mx xmax+mx]);
    ylim([ymin-my ymax+my]);
    pause(0.01);
end



function Y = Gram_Schmidt(M, r)
    if isempty(M) || r == 0
        Y = zeros(size(M,1), 0);
        return;
    end
    [Q, ~] = qr(M, 0);            
    Y      = real(Q(:, 1:min(r, size(Q,2))));
end

function N = compute_null(M)
    N = real(null(M));
    if isempty(N)
        N = zeros(size(M,2), 0); 
    end
end

function [Y_intersect, r] = zassenhaus(A_rows, B_rows)
    n   = size(A_rows, 2);
    tol = 1e-8;

    Z = [A_rows,  A_rows;
         B_rows,  zeros(size(B_rows,1), n)];
    N = real(null(Z));

    first_half_zero = all(abs(N(1:n, :)) < tol, 1);

    if any(first_half_zero)
        Y_raw       = N(n+1:end, first_half_zero);
        Y_intersect = real(orth(Y_raw)');         
        r           = size(Y_intersect, 1);
    else
        P_A  = A_rows' * pinv(A_rows');
        P_B  = B_rows' * pinv(B_rows');

        M = P_A + P_B;
        M = (M + M') / 2; 

        [e_vec, e_val] = eig(M);
        ev           = diag(e_val);
        in_both      = abs(ev - 2) < tol;   

        if any(in_both)
            Y_intersect = real(orth(real(e_vec(:, in_both)))');
            r           = size(Y_intersect, 1);
        else
            Y_intersect = zeros(0, n);      
            r           = 0;
        end
    end
end

