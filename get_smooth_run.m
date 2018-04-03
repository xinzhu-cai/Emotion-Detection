%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       get fea_movingAve fea_LDS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% english fea_movingAve fea_LDS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% path_fea = 'G:\drn\thesis\data\english\feature_scale';
% path_smooth = 'G:\drn\thesis\data\english\feature_smooth_scale';
% fileList={...
%     'caoyang_20130505','caoyang_20130523','duanruonan_20130602','duanruonan_20130606',...
%     'lichenguang_20130505','lichenguang_20130517','luolujin_20130504','luolujin_20130517',...
%     'meijincheng_20130602','meijincheng_20130609','zhengweilong_20130504','zhengweilong_20130522'};
% fileNum = length(fileList);
% feature_name_list = {'de','psd','dasm','rasm','asm'};
% for i=1:fileNum
%     filename = fileList{i};
%     fea_file = sprintf('%s\\%s.mat', path_fea,filename);
%     fea_smooth_file = sprintf('%s\\%s.mat', path_smooth,filename);
%     disp(sprintf('processing %s ...\n', fea_file));
%     load (fea_file);
%     for j = 1:12
%         tic;
%         for p = 1:length(feature_name_list)
%             feature_name = feature_name_list{p};
%             fprintf('%s%d',feature_name,j);
%             eval(['raw_feature','=',feature_name,num2str(j),';']);
%             fea_movingAve = movingAve(raw_feature,1,5);
%             fea_LDS = lds(raw_feature);
%             eval([feature_name,'_movingAve',num2str(j),'=','fea_movingAve;']);
%             eval([feature_name,'_LDS',num2str(j),'=','fea_LDS;']);
%             if exist(fea_smooth_file,'file') == 0
%                 eval(['save',' ',fea_smooth_file,' ',feature_name,'_movingAve',num2str(j),';']);
%             else
%                 eval(['save',' -append ',fea_smooth_file,' ',feature_name,'_movingAve',num2str(j),';']);
%             end
%             eval(['save',' -append ',fea_smooth_file,' ',feature_name,'_LDS',num2str(j),';']);
%             fprintf('\n');
%         end
%         toc;
%     end
% end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% chinese DASM RASM ASM
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
path_fea = 'G:\zwl\Emotion\data\chinese\feature';
path_smooth = 'G:\zwl\Emotion\data\chinese\feature_smooth';
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
feature_name_list = {'de','psd','dasm','rasm','asm','dcau'};
for i=1:fileNum
    filename = fileList{i};
    fea_file = sprintf('%s\\%s.mat', path_fea,filename);
    fea_smooth_file = sprintf('%s\\%s.mat', path_smooth,filename);
    disp(sprintf('processing %s ...\n', fea_file));
    load (fea_file);
    for j = 1:15
        for p = 1:length(feature_name_list)
            feature_name = feature_name_list{p};
            fprintf('%s%d',feature_name,j);
            eval(['raw_feature','=',feature_name,num2str(j),';']);
            fea_movingAve = movingAve(raw_feature,1,5);
            fea_LDS = lds(raw_feature);
            eval([feature_name,'_movingAve',num2str(j),'=','fea_movingAve;']);
            eval([feature_name,'_LDS',num2str(j),'=','fea_LDS;']);
            if exist(fea_smooth_file,'file') == 0
                eval(['save',' ',fea_smooth_file,' ',feature_name,'_movingAve',num2str(j),';']);
            else
                eval(['save',' -append ',fea_smooth_file,' ',feature_name,'_movingAve',num2str(j),';']);
            end
            eval(['save',' -append ',fea_smooth_file,' ',feature_name,'_LDS',num2str(j),';']);
        end
    end
end