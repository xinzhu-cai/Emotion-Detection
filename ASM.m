function [ dasm, rasm, asm, dcau] = ASM( de )
%   ASM get DASM, RASM, ASM feature from 62 channel DE feature 
%   input:  de [n*l*k]         n electrodes, l windows, k frequency bands
%   output: dasm, rasm, asm [n*l*k] n pairs, l windows, k frequency bands 

    %F1 Fp1 F7 F3 FT7 FC3 T7 P7 C3 TP7 CP3 P3 O1 AF3 F5 FC5 FC1 C5 C1 CP5 CP1 
    %P5 P1 PO7 PO5 PO3 CB1
    leftList = [9 1 6 8 15 17 24 42 26 33 35 44 59 4 7 16 18 25 27 34 36 43 45 51 52 53 58];
    %F2 Fp2 F8 F4 FT8 FC4 T8 P8 C4 TP8 CP4 P4 O2 AF4 F6 FC6 FC2 C6 C2 CP6 CP2
    %P6 P2 PO8 PO6 PO4 CB2
    rightList = [11 3 14 12 23 21 32 50 30 41 39 48 61 5 13 22 20 31 29 40 38 49 47 57 56 55 62];
    upList = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23];
    %Fp1 Fpz Fp2 AF3 AF4 F7 F5 F3 F1 Fz F2 F4 F6 F8 FT7 FC5 FC3 FC1 FCZ FC2 FC4 FC6 FT8
    downList = [59 60 61 58 62 42 43 44 45 46 47 48 49 50 33 34 35 36 37 38 39 40 41];
    %O1 OZ O2 CB1 CB2 P7 P5 P3 P1 PZ P2 P4 P6 P8 TP7 CP5 CP3 CP1 CPZ CP2 CP4 CP6 TP8
    [eleNum winNum fNum] = size(de);
    pairNum = length(leftList);
    dasm = zeros(pairNum, winNum, fNum);
    rasm = zeros(pairNum, winNum, fNum);
    asm = zeros(pairNum*2, winNum, fNum);
    pairNum = length(upList);
    dcau = zeros(pairNum, winNum, fNum);
    for i = 1:length(leftList)
        dasm(i,:,:) = de(leftList(i),:,:) - de(rightList(i),:,:);
        rasm(i,:,:) = de(leftList(i),:,:) ./ de(rightList(i),:,:);
        asm(i,:,:) = de(leftList(i),:,:) - de(rightList(i),:,:);
        asm(i + pairNum, :, :) = de(leftList(i),:,:) ./ de(rightList(i),:,:);
    end
    for i = 1:length(upList)
        dcau(i,:,:) = de(upList(i),:,:) - de(downList(i),:,:);
    end
end
