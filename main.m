
% test on the matrix completion problem
currpath = cd ;
addpath(genpath(currpath)) ;


newDataFlag = 1 ;

if newDataFlag == 1    
    clc ;
    close all ;
    m = 150 ;
    n = m ;
    r = 22 ;
    ML = (randn(m,r)); MR = (randn(n,r));
    p = 0.5 * m* n ;
    rho_s = p / (m * n);    
    [I J col omega] = myRandsample(m, n, p);
    V = UVtOmega(ML, MR, I, J, col);    
    D = spconvert([I,J,V; m,n,0]);
%     clear I J col;    
end


IDX = omega ;
sizeX = [m,n] ;
M = opRestriction(prod(sizeX), IDX);
X = ML*MR' ;
x = X(:);
y = M(x,1);

% IRNN with different penalties
fun = 'lp' ;        gamma = 0.5 ;
% fun = 'scad' ;      gamma = 100 ;
% fun = 'logarithm' ; gamma = 10 ;
% fun = 'mcp' ; gamma = 10 ;
% fun = 'cappedl1' ; gamma = 1000 ;
% fun = 'etp' ;  gamma = 0.1 ;
% fun = 'geman' ;  gamma = 10 ;
% fun = 'laplace' ; gamma = 10 ;

tic
XRec = IRNN(fun,y,M,m,n,gamma) ;
toc
err = norm(X-XRec,'fro')/norm(X,'fro')







