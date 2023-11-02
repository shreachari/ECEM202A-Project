x = rand(59881,1);
alpha = 2000;        % moderate bandwidth constraint
tau = 0;            % noise-tolerance (no strict fidelity enforcement)
K = 3;              % 3 modes
DC = 0;             % no DC part imposed
init = 1;           % initialize omegas uniformly
tol = 1e-7;
%--------------- Run actual VMD code
[u, u_hat, omega] = VMD_down(x, alpha, tau, K, DC, init, tol);