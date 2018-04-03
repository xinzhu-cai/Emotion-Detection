function [ sequence_new ] = lds( sequence )
%LDS 
%   input:  sequence[n*l*k]         n electrodes, l windows, k frequency
%   bands
%   output: sequence_new[n*l*k]     sequence after smoothed
    [n,l,k] = size(sequence);
    sequence_new = zeros(n,l,k);
    ave = mean(sequence,2);
    for i = 1:n
        for j = 1:k
            X = sequence(i,:,j);
            para.u0 = ave(i,1,j);
            para.V0 = 0.1;%duan 0.01
            para.A = 1;
            para.T = 0.001;%duan 0.0001
            para.C = 1;
            para.sigma = 1;
            para.givenAll = 1;
            para_new = para;
%             para_new = DLM_Learning(X,para,5);
            Y = DLM_Inference(X, para_new);
            X = Y.z;
            sequence_new(i,:,j) = reshape(X,1,l,1);
        end
        fprintf('.');
    end
    fprintf('\n');
end

