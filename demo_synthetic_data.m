% test IRNN for matrix completion on synthetic data

addpath(genpath(cd));

clc
close all
m = 150 ;
n = m ;
r = 22;
ML = (randn(m,r)); MR = (randn(n,r));
p = 0.5 * m* n ;
rho_s = p / (m * n);
[I, J, col, omega] = myRandsample(m, n, p);
V = UVtOmega(ML, MR, I, J, col);
D = spconvert([I,J,V; m,n,0]);
sizeX = [m,n];
M = opRestriction(prod(sizeX), omega);
X = ML*MR';
x = X(:);
y = M(x,1);

% choose penalty in IRNN
fun = 'lp' ;        gamma = 0.5;
% fun = 'scad' ;      gamma = 100;
% fun = 'logarithm' ; gamma = 10;
% fun = 'mcp' ; gamma = 10;
% fun = 'etp' ;  gamma = 0.1;

lambda_Init = max(abs(M(y,2)));
lambda_rho = 0.9;
Xhat = IRNN(fun,y,M,m,n,gamma,lambda_Init,lambda_rho);
relative_err = norm(X-Xhat,'fro')/norm(X,'fro')



