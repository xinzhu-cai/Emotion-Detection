function [ sequence_new ] = movingAve( sequence, ifOnline, window )
%MOVINGAVE 
%   input:  sequence[n*l*k]         n electrodes, l windows, k frequency bands
%           ifOnline                1:online;0:offline(have not implemented)
%           window                  the length of smooth window (>1)
%   output: sequence_new[n*l*k]     sequence after smoothed
    [n,l,k] = size(sequence);
    sequence_new = zeros(n,l,k);
    for i = 1:l
        if ifOnline == 1
            if i < window
                sequence_new(:,i,:) = sequence(:,i,:);
            else
                for j = 1:window
                    sequence_new(:,i,:) = sequence_new(:,i,:) + sequence(:,i-j+1,:);
                end
                sequence_new(:,i,:) = sequence_new(:,i,:) ./ window;
            end
        else if ifOnline == 0
            else
            end
        end
    end
end

