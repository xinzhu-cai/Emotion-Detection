function [ sequence_new ] = lds_window( sequence, window )
%LDS_WINDOW 
%   input:  sequence[n*l*k]         n electrodes, l windows, k frequency
%   bands
%           window                  window_length
%   output: sequence_new[n*l*k]     sequence after smoothed
[n l k] = size(sequence);
sequence_new = zeros(n,l,k);
for i = 1:(fix(l/window)+1)
    window_start = (i-1)*window+1;
    if i ~= fix(l/window) + 1
        window_end = i * window;
    else
        window_end = l;
    end
    if window_end - window_start < 1
        continue
    end
    sub_sequence = sequence(:,window_start:window_end,:);
    sub_sequence = lds(sub_sequence);
    sequence_new(:, window_start:window_end, :) = sub_sequence;
end
fprintf('\n');
end

