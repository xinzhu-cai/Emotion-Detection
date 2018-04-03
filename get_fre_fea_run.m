%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       get svm result of 5 frequency bands & 5 features
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% english
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% path_smooth = 'G:\drn\thesis\data\english\feature_new_de';
% path_result = 'G:\drn\thesis\data\english\result_new_de';
% fileList={...
%     'caoyang_20130505','caoyang_20130523','duanruonan_20130602','duanruonan_20130606',...
%     'lichenguang_20130505','lichenguang_20130517','luolujin_20130504','luolujin_20130517',...
%     'meijincheng_20130602','meijincheng_20130609','zhengweilong_20130504','zhengweilong_20130522'};
% %fileList={...
% %  'lichenguang_20130517','meijincheng_20130602','meijincheng_20130609'};
% label = [-1,1,-1,1,-1,1,-1,1,-1,1,-1,1];
% result_file_name = sprintf('%s\\%s.txt',path_result,'freXfeaXnonorm');
% fid_result = fopen(result_file_name,'wt');
% fileNum = length(fileList);
% feature_name_list = {'psd','de','dasm','rasm','asm'};
% feature_name_list = {'de'};
% dim_list = [62,62,27,27,54];
% fprintf(fid_result,'Feature\tTotal\tDelta\tTheta\tAlpha\tBeta\tGamma\n');
% for i=1:fileNum
%     filename = fileList{i};
%     fea_smooth_file = sprintf('%s\\%s.mat', path_smooth,filename);
%     fprintf(fid_result,'%s\n',filename);
%     disp(sprintf('processing %s ...\n', fea_smooth_file));
%     load (fea_smooth_file);
%     for p = 1:length(feature_name_list)
%         feature_name = feature_name_list{p};
%         fprintf(fid_result,'%s',feature_name);
%         dim = dim_list(p);
%         %5 frequency bands
%         for j = 0:5
% %            prepare train data
%             if j ~= 0
%                 train_inst = zeros(dim,0);
%             else
%                 train_inst = zeros(dim*5, 0);
%             end
%             train_label = zeros(1,0);
%             %8 cases
%             for t = 1:8
%                 eval(['feature = ', feature_name, '', num2str(t), ';']);
%                 [use_less case_num] = size(feature(:,:,1));
%                 if j ~= 0
%                     train_inst = [train_inst feature(:,:,j)];
%                 else
%                     temp_inst = [];
%                     for fre = 1:5
%                         temp_inst = [temp_inst;feature(:,:,fre)];
%                     end
%                     train_inst = [train_inst temp_inst];
%                 end
%                 train_label = [train_label label(t)*ones(1,case_num)];
%             end
%             %prepare test data
%             if j ~= 0 
%                 test_inst = zeros(dim, 0);
%             else
%                 test_inst = zeros(dim*5, 0);
%             end
%             test_label = zeros(1, 0);
%             %4 cases
%             for t = 9:12
%                 eval(['feature = ', feature_name, '', num2str(t), ';']);
%                 [use_less case_num] = size(feature(:,:,1));
%                 if j ~= 0
%                     test_inst = [test_inst feature(:,:,j)];
%                 else
%                     temp_inst = [];
%                     for fre = 1:5
%                         temp_inst = [temp_inst;feature(:,:,fre)];
%                     end
%                     test_inst = [test_inst temp_inst];
%                 end
%                 test_label = [test_label label(t)*ones(1,case_num)];
%             end
%             %normalize
%             
% %             [tt vv] = size(train_inst);
% %             for vvv = 1:vv
% %                 min_num = min(train_inst(:,vvv));
% %                 max_num = max(train_inst(:,vvv));
% %                 train_inst(:,vvv) = (train_inst(:,vvv) - min_num)/((max_num-min_num)/10);
% %             end
% %             [tt vv] = size(test_inst);
% %             for vvv = 1:vv
% %                 min_num = min(test_inst(:,vvv));
% %                 max_num = max(test_inst(:,vvv));
% %                 test_inst(:,vvv) = (test_inst(:,vvv) - min_num)/((max_num-min_num)/10);
% %             end
% 
% %             [tt vv] = size(train_inst);
% %             for vvv = 1:vv
% %                 ave_num = mean(train_inst(:,vvv));
% %                 if j ~= 0
% %                     train_inst(:,vvv) = train_inst(:,vvv) - ave_num*ones(dim,1);
% %                 else
% %                     train_inst(:,vvv) = train_inst(:,vvv) - ave_num*ones(dim*5,1);
% %                 end
% %             end
% %             [tt vv] = size(test_inst);
% %             for vvv = 1:vv
% %                 ave_num = mean(test_inst(:,vvv));
% %                 if j ~= 0
% %                     test_inst(:,vvv) = test_inst(:,vvv) - ave_num*ones(dim,1);
% %                 else
% %                     test_inst(:,vvv) = test_inst(:,vvv) - ave_num*ones(dim*5,1);
% %                 end
% %             end
%             %svm test
%             temp_result = 0;
%             for c = -10:10
%                  para = sprintf('-s 3 -c %.5f',2^c);
%                  model = train(train_label', sparse(train_inst'), para);
%                 %model = svmtrain(train_label', train_inst', '-b 1');
%                  [a p b] = predict(test_label', sparse(test_inst'), model);
%                  if p(1) > temp_result
%                      temp_result = p(1);
%                  end
%             end
%              
%             for c = 1:0.5:10
%                  para = sprintf('-s 3 -c %.5f',c);
%                  model = train(train_label', sparse(train_inst'), para);
%                 %model = svmtrain(train_label', train_inst', '-b 1');
%                  [a p b] = predict(test_label', sparse(test_inst'), model);
%                  if p(1) > temp_result
%                      temp_result = p(1);
%                  end
%              end
%              fprintf(fid_result,'\t%.2f',temp_result);
%         end
%         fprintf(fid_result,'\n');
%     end
% end
% fclose(fid_result);
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% chinese
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
path_smooth = 'G:\zwl\Emotion\data\chinese\feature_smooth';
% path_result = 'G:\zwl\Emotion\data\chinese\result';
path_result = 'G:\zwl\Emotion\code\DNN\result';
fileList={...
    'dujingcheng_20131027','dujingcheng_20131030','dujingcheng_20131107',...
    'mahaiwei_20130712','mahaiwei_20131016','mahaiwei_20131113',...
    'penghuiling_20131027','penghuiling_20131030','penghuiling_20131106',...
    'zhujiayi_20130709','zhujiayi_20131016','zhujiayi_20131105',...
    'wuyangwei_20131127','wuyangwei_20131201','wuyangwei_20131207',...
    'weiwei_20131130','weiwei_20131204','weiwei_20131211',...
    'jianglin_20140404','jianglin_20140413','jianglin_20140419',...
    'liuye_20140411','liuye_20140418','liuye_20140506',...%'liuye_20140516',
    'sunxiangyu_20140511','sunxiangyu_20140514','sunxiangyu_20140521',...
    'xiayulu_20140527','xiayulu_20140603','xiayulu_20140610',...
    'jingjing_20140603','jingjing_20140611','jingjing_20140629',...%'jingjing_20140616',
    'yansheng_20140601','yansheng_20140615','yansheng_20140627',...%'yansheng_20140622',
    'wusifan_20140618','wusifan_20140625','wusifan_20140630',...
    'wangkui_20140620','wangkui_20140627','wangkui_20140704',...
    'liuqiujun_20140621','liuqiujun_20140702','liuqiujun_20140705',...%'liuqiujun_20140629',
    };
label = [1,0,-1,-1,0,1,-1,0,1,1,0,-1,0,1,-1];
result_file_name = sprintf('%s\\%s.txt',path_result,'meanscaleXLDS_SVM');
fid_result = fopen(result_file_name,'wt');
fileNum = length(fileList);
feature_name_list = {'psd','de','dasm','rasm','asm','dcau'};
dim_list = [62,62,27,27,54,23];
fprintf(fid_result,'Feature\tTotal\tDelta\tTheta\tAlpha\tBeta\tGamma\n');
for i=1:fileNum
    filename = fileList{i};
    fea_smooth_file = sprintf('%s\\%s.mat', path_smooth,filename);
    fprintf(fid_result,'%s\n',filename);
    disp(sprintf('processing %s ...\n', fea_smooth_file));
    load (fea_smooth_file);
    for p = 1:length(feature_name_list)
        feature_name = feature_name_list{p};
        fprintf(fid_result,'%s',feature_name);
        dim = dim_list(p);
        %5 frequency bands
        for j = 0:5
            %prepare train data
            if j ~= 0
                train_inst = zeros(dim,0);
            else
                train_inst = zeros(dim*5, 0);
            end
            train_label = zeros(1,0);
            %9 cases
            for t = 1:9
                eval(['feature = ', feature_name, '_LDS',num2str(t), ';']);
                [use_less case_num] = size(feature(:,:,1));
                if j ~= 0
                    train_inst = [train_inst feature(:,:,j)];
                else
                    temp_inst = [];
                    for fre = 1:5
                        temp_inst = [temp_inst;feature(:,:,fre)];
                    end
                    train_inst = [train_inst temp_inst];
                end
                train_label = [train_label label(t)*ones(1,case_num)];
            end
            %prepare test data
            if j ~= 0 
                test_inst = zeros(dim, 0);
            else
                test_inst = zeros(dim*5, 0);
            end
            test_label = zeros(1, 0);
            %5 cases
            for t = 10:15
                eval(['feature = ', feature_name, '_LDS',num2str(t), ';']);
                [use_less case_num] = size(feature(:,:,1));
                if j ~= 0
                    test_inst = [test_inst feature(:,:,j)];
                else
                    temp_inst = [];
                    for fre = 1:5
                        temp_inst = [temp_inst;feature(:,:,fre)];
                    end
                    test_inst = [test_inst temp_inst];
                end
                test_label = [test_label label(t)*ones(1,case_num)];
            end
%             %scalenorm
            [tt vv] = size(train_inst);
            for vvv = 1:vv
                min_num = min(train_inst(:,vvv));
                max_num = max(train_inst(:,vvv));
                train_inst(:,vvv) = 10*(train_inst(:,vvv) - min_num)/(max_num-min_num);
            end
            [tt vv] = size(test_inst);
            for vvv = 1:vv
                min_num = min(test_inst(:,vvv));
                max_num = max(test_inst(:,vvv));
                test_inst(:,vvv) = 10*(test_inst(:,vvv) - min_num)/(max_num-min_num);
            end
            %meannorm
            [tt vv] = size(train_inst);
            for vvv = 1:vv
                ave_num = mean(train_inst(:,vvv));
                if j ~= 0
                    train_inst(:,vvv) = train_inst(:,vvv) - ave_num*ones(dim,1);
                else
                    train_inst(:,vvv) = train_inst(:,vvv) - ave_num*ones(dim*5,1);
                end
            end
            [tt vv] = size(test_inst);
            for vvv = 1:vv
                ave_num = mean(test_inst(:,vvv));
                if j ~= 0
                    test_inst(:,vvv) = test_inst(:,vvv) - ave_num*ones(dim,1);
                else
                    test_inst(:,vvv) = test_inst(:,vvv) - ave_num*ones(dim*5,1);
                end
            end
            % svm test
            temp_result = 0;
%             for c = 1.5:0.5:10
%                  para = sprintf('-s 3 -c %f',c);
%                  model = train(train_label', sparse(train_inst'), para);
%                 %model = svmtrain(train_label', train_inst', '-b 1');
%                  [a p b] = predict(test_label', sparse(test_inst'), model);
%                  if p(1) > temp_result
%                      temp_result = p(1);
%                  end
%             end
            for c = -10:10
                para=sprintf('-s 3 -c %f',2^c);
                model = train(train_label', sparse(train_inst'), para);
                %model = svmtrain(train_label', train_inst', '-b 1');
                [a p b] = predict(test_label', sparse(test_inst'), model);
                if p(1) > temp_result
                    temp_result = p(1);
                end
            end
            fprintf(fid_result,'\t%.2f',temp_result);
        end
        fprintf(fid_result,'\n');
    end
end
fclose(fid_result);