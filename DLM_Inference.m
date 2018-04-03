function Y = DLM_Inference(x,para)
%input:
% x is the observation sequence, M by N matrix
% para.A, para.T, para.C, para.sigma, para.u0, para.V0 are the model parameters
%output:
% Y.z is the latent state sequence
% Y.P, Y.u, Y.V, Y.K, Y.J, Y.uAll, Y.VAll are the latent parameters
% Y.givenAll is the flag to indicate whether use all the observations to estimate the latent state
% 2009.11.25, Shi,Lichen, Shanghai Jiao Tong University

u0 = para.u0;
V0 = para.V0;
A = para.A;
T = para.T;
C = para.C;
m_sigma = para.sigma;

[m,n] = size(x);
P = zeros(m,m,n);
u = zeros(m,n);
V  = zeros(m,m,n);
K = zeros(m,m,n);

K(:,:,1) = V0*C'/(C*V0*C'+m_sigma);
u(:,1) =u0+K(:,:,1)*(x(:,1)-C*u0);
V(:,:,1) = (eye(m) - K(:,:,1)*C)*V0;

for i = 2:n
    P(:,:,i-1) = A*V(:,:,i-1)*A'+T;
    K(:,:,i) = P(:,:,i-1)*C'/(C*P(:,:,i-1)*C'+m_sigma);
    u(:,i) = A*u(:,i-1)+K(:,:,i)*(x(:,i)-C*A*u(:,i-1));
    V(:,:,i) = (eye(m) - K(:,:,i)*C)*P(:,:,i-1);
end

if ~isfield(para,'givenAll')
    para.givenAll = 0;
end
if para.givenAll == 1
    uAll = zeros(m,n);
    VAll  = zeros(m,m,n);
    J = zeros(m,m,n);
    uAll(:,n) = u(:,n);
    VAll(:,:,n) = V(:,:,n);
    for i = n-1:-1:1
        J(:,:,i) = V(:,:,i)*A'/P(:,:,i);
        uAll(:,i) = u(:,i)+J(:,:,i)*(uAll(:,i+1)-A*u(:,i));
        VAll(:,:,i) = V(:,:,i)+J(:,:,i)*(VAll(:,:,i+1)-P(:,:,i))*J(:,:,i)';
    end
    Y.z = uAll;
    Y.uAll = uAll;
    Y.J = J;
    Y.VAll = VAll;
else
    Y.z = u;
end
Y.P = P;
Y.u = u;
Y.V = V;
Y.K = K;

