%% file demo_new.m
% this file shows the usage of Least_L21.m function 
% and study the group sparsity patterns. 
%
%% OBJECTIVE
% argmin_W { sum_i^t (0.5 * norm (Y{i} - X{i}' * W(:, i))^2) 
%            + rho1 * \|W\|_{2,1} + opts.rho_L2 * \|W\|_F^2}
%
%%
clear;
predict_num = 1; % the predict task number, need to change for every task
load('GPCR1.mat'); % load sample data.
d = size(X{1}, 2);  % dimensionality.

lambda = [0 0.0001];

opts.init = 0;      % guess start point from data. 
opts.tFlag = 1;     % terminate after relative objective value does not changes much.
opts.tol = 10^-5;   % tolerance. 
opts.maxIter = 1000; % maximum iteration number of optimization.

sparsity = zeros(length(lambda), 1);

for i = 1:length(lambda)
    [W funcVal] = Least_L21(X, Y, lambda(i), opts);
    % set the solution as the next initial point. 
    % this gives better efficiency. 
    opts.init = 1;
    opts.W0 = W;
    sparsity(i) = nnz(sum(W,2 )==0)/d;
end

task_num = length(X);
y_pred = cell(1, task_num);
 for t = 1 : task_num
     y_pred{1,t} = X{1,t} * W(:, t);
     RMSE{1,t} = sqrt(sum((y_pred{1,t}-Y{1,t}).^2)/length(Y{1,t}));
     RSQ{1,t} =rsq(Y{1,t},y_pred{1,t});
 end
res = sprintf('RMSE is %.4f, R^2 is  %.4f',RMSE{1,predict_num},RSQ{1,predict_num});
disp(res)

