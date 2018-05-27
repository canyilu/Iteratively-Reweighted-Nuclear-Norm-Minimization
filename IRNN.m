function X = IRNN(fun,y,M,m,n,gamma,err,x_initial,normfac,insweep,tol,decfac)

hfun_sg = str2func( [ fun '_sg'] ) ;

if nargin < 6
    gamma = 1;
end
if nargin < 7
    err = 1e-6;
end
if nargin < 8
    x_initial = zeros(m*n,1);
end
if nargin < 9
    normfac = 1;
end
if nargin < 10
    insweep = 200;
end
if nargin < 11
    tol = 1e-5;    
end
if nargin < 12
    decfac = 0.9;
end

mu = 1.1*normfac;
x = x_initial;
lambdaInit = decfac*max(abs(M(y,2))); lambda = lambdaInit;
f_current = norm(y-M(x,1)) + lambda*norm(x,1);
while lambda > lambdaInit*tol
%     obj = [] ;
    for ins = 1:insweep    
%         obj(ins) = sum(hfun(svd(reshape(x,sizeX),'econ'),gamma,lambda)) + 0.5*norm(y-M(x,1))^2 ;
        f_previous = f_current;
        x = x + (1/mu)*M(y - M(x,1),2);
        [U,S,V] = svd(reshape(x,[m,n]),'econ');
        sigma = diag(S) ;
        w = hfun_sg(sigma,gamma,lambda) ; 
        sigma = sigma - w/mu ;
        svp = length(find(sigma>0)) ;
        sigma = sigma(1:svp) ;
        X = U(:,1:svp)*diag(sigma)*V(:,1:svp)' ;
        x = X(:) ;        
        f_current = norm(y-M(x,1)) + lambda*norm(x,1) ;
        if norm(f_current-f_previous)/norm(f_current + f_previous)<tol
            break;
        end
    end
    if norm(y-M(x,1))<err
        break ;
    end
    lambda = decfac*lambda;
end



