%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       get DASM, RASM, ASM
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% english DASM RASM ASM
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% path_fea = 'G:\drn\thesis\data\english\feature_scale';
% fileList={...
%     'caoyang_20130505','caoyang_20130523','duanruonan_20130602','duanruonan_20130606',...
%     'lichenguang_20130505','lichenguang_20130517','luolujin_20130504','luolujin_20130517',...
%     'meijincheng_20130602','meijincheng_20130609','zhengweilong_20130504','zhengweilong_20130522'};
% fileNum = length(fileList);
% for i=1:fileNum
%     filename = fileList{i};
%     fea_file = sprintf('%s\\%s.mat', path_fea,filename);
%     disp(sprintf('processing %s ...\n', fea_file));
%     load (fea_file);
%     for j = 1:12
%         eval(['de','=','de',num2str(j),';']);
%         [dasm,rasm,asm] = ASM(de);
%         eval(['dasm',num2str(j),'=','dasm;']);
%         eval(['rasm',num2str(j),'=','rasm;']);
%         eval(['asm', num2str(j),'=','asm;']);
%         eval(['save',' -append ',fea_file,' dasm',num2str(j),';']);
%         eval(['save',' -append ',fea_file,' rasm',num2str(j),';']);
%         eval(['save',' -append ',fea_file,' asm',num2str(j),';']);
%     end
%     clearvars -except fileNum path_fea fileList;
% end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% chinese DASM RASM ASM
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
path_fea = 'E:\Lab\Data\EEG_eye_emotion3\EEG_split';
fileList={...
    'dujingcheng_20131027','dujingcheng_20131030','dujingcheng_20131107',...
    'mahaiwei_20131016','mahaiwei_20131113','mahaiwei_20130712',...
    'penghuiling_20131027','penghuiling_20131030','penghuiling_20131106',...
    'zhujiayi_20130709','zhujiayi_20131016','zhujiayi_20131105',...
    'wuyangwei_20131127','wuyangwei_20131201','wuyangwei_20131207',...
    'weiwei_20131130','weiwei_20131204','weiwei_20131211',...
    'jianglin_20140404','jianglin_20140413','jianglin_20140419',...
    'liuye_20140411','liuye_20140418','liuye_20140506','liuye_20140516',...
    'sunxiangyu_20140511','sunxiangyu_20140514','sunxiangyu_20140521',...
    'xiayulu_20140527','xiayulu_20140603','xiayulu_20140610',...
    'jingjing_20140603','jingjing_20140611','jingjing_20140616','jingjing_20140629',...
    'yansheng_20140601','yansheng_20140615','yansheng_20140622','yansheng_20140627',...
    'wusifan_20140618','wusifan_20140625','wusifan_20140630',...
    'wangkui_20140620','wangkui_20140627','wangkui_20140704',...
    'liuqiujun_20140621','liuqiujun_20140629','liuqiujun_20140702','liuqiujun_20140705',...
    };
fileNum = length(fileList);
for i=1:fileNum
    filename = fileList{i};
    fea_file = sprintf('%s\\%s.mat', path_fea,filename);
    disp(sprintf('processing %s ...\n', fea_file));
    load (fea_file);
    for j = 1:15
        eval(['de','=','de',num2str(j),';']);
        [dasm,rasm,asm,dcau] = ASM(de);
        eval(['dasm',num2str(j),'=','dasm;']);
        eval(['rasm',num2str(j),'=','rasm;']);
        eval(['asm', num2str(j),'=','asm;']);
        eval(['dcau',num2str(j),'=','dcau;']);
        eval(['save',' -append ',fea_file,' dasm',num2str(j),';']);
        eval(['save',' -append ',fea_file,' rasm',num2str(j),';']);
        eval(['save',' -append ',fea_file,' asm',num2str(j),';']);
        eval(['save',' -append ',fea_file,' dcau',num2str(j),';']);
    end
    clearvars -except fileNum path_fea fileList;
end