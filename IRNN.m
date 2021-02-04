function X = IRNN(fun,y,M,m,n,gamma,lambda_Init,lambda_rho,tol)

% Written by Canyi Lu (canyilu@gmail.com)
%
% References: 
%
% Canyi Lu, Jinhui Tang, Shuicheng Yan and Zhouchen Lin,
% Nonconvex Nonsmooth Low Rank Minimization via Iteratively Reweighted Nuclear Norm,
% IEEE Transactions on Image Processing, vol. 25, pp. 829-839, 2016
%
% % Canyi Lu, Jinhui Tang, Shuicheng Yan and Zhouchen Lin,
% Generalized Nonconvex Nonsmooth Low-Rank Minimization,
% International Conference on Computer Vision and Pattern Recognition (CVPR), 2014


if nargin < 6
    gamma = 1;
end
if nargin < 7
    lambda_Init = max(abs(M(y,2)));
end
if nargin < 8
    lambda_rho = 0.9;
end
if nargin < 9
    tol = 1e-5;
end
hfun_sg = str2func([fun '_sg']);
lambda = lambda_Init;
lambda_Target = lambda_Init * 1e-5;
mu = 1.1;
insweep = 200;
x = zeros(m*n,1);
f_current = norm(y-M(x,1)) + lambda*norm(x,1);
while lambda > lambda_Target
     for ins = 1 : insweep    
         f_previous = f_current;
         x = x + (1/mu)*M(y - M(x,1),2);
         [U,S,V] = svd(reshape(x,[m,n]),'econ');
         sigma = diag(S);
         w = hfun_sg(sigma,gamma,lambda);
         sigma = sigma - w/mu;
         svp = length(find(sigma>0));
         sigma = sigma(1:svp);
         X = U(:,1:svp)*diag(sigma)*V(:,1:svp)';
         x = X(:);
         f_current = norm(y-M(x,1)) + lambda*norm(x,1);
         if norm(f_current-f_previous)/norm(f_current + f_previous) < tol
             break;
         end
     end
    if norm(y-M(x,1)) < tol
        break;
    end
    lambda = lambda_rho*lambda;
end
