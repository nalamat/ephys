%--------------------------------------------------------------------------
% read_behavior_data.m
%--------------------------------------------------------------------------
%
% reads in log files and converts them into Matlab Results cell array
%--------------------------------------------------------------------------
% Antje Ihlefeld Jan 2018
%--------------------------------------------------------------------------

%% Initialization:
%  ---------------
clear
close all
clc
Params.mainpath = '../Data/';
%Params.IDs = {'CMR02Head';'CMR02Fluffy';'CMR02Left';'CMR02Right'};%folder names for all animals
Params.IDs = {'CMR04Right';'CMR04Left';'CMR04Head';'CMR04Fluffy';'CMR04Tail'};%folder names for all animals
summary_file_name = 'CMR04Data.mat';

% Read columns of data as text:
formatSpec = '%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%[^\n\r]';
delimiter = ',';


%% aggregate all log file names
% -----------------------------
for which_animal = 1 : length(Params.IDs)
    d = dir([Params.mainpath, '/', Params.IDs{which_animal}]);
    cnt = 0;
    clear fname
    fname(1).name  = '';
    for which_file = 1 : length(d)
        n = d(which_file).name;
        if length(n)>4
            if strcmp(n(end-3:end),'.log')
                cnt = cnt+1;
                fname(cnt).name = n;
            end
        end
    end
    Params.Filenames{which_animal} = fname;
end
clear d n fname
Params2 = Params;
%% extract data
for which_animal = 1 : length(Params.IDs)
    clear Params BIG_RESULTS_MATRIX
    Params = Params2;
    
    l = Params.Filenames{which_animal};
    fprintf('Animal %s has %d sessions\n', Params.IDs{which_animal}, length(l));
    for which_file = 1 : length(l)
		fprintf('\tProcessing session %d\n', which_file);
        %housekeeping
        clear Trial_log trial_log filename fileID dataArray
        cnt = 0;
        
        filename = [Params.mainpath, '/', Params.IDs{which_animal}, '/', l(which_file).name];
        fileID = fopen(filename,'r');        % Open the log file.
        % Read columns of data according to formatSpec & delimiter.
        dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'TextType', 'string',  'ReturnOnError', false);
        fclose(fileID);% Close the text file.
        
        clear masker_type date_str date_num
        
        for which_line = 1: length(dataArray{1,2})
            if ~isempty(strfind(dataArray{1,2}(which_line),'Trial log'))
                cnt = cnt + 1;
                trial_log = [];
                for which_ind = 1 : 72
                    trial_log = [trial_log, char(dataArray{1,which_ind}(which_line))];
                end
                Trial_log{cnt} = trial_log;
                
                
                ind =strfind(trial_log,'expression_masker_filename');
                ind2 =strfind(trial_log,'.wav');
                masker_type = trial_log(ind+34:ind2-1);
                m_pth = strfind(masker_type,'/');
                if ~isempty(m_pth)
                    masker_type = masker_type(m_pth(end)+1:end);
                end
                date_str = trial_log(2:20);
                date_num = datenum(trial_log(2:20),'yyyy-mm-dd HH:MM:SS');
                
                Results.DATA{which_animal}.results(which_file).masker_type = masker_type;
                Results.DATA{which_animal}.results(which_file).date_str = date_str;
                Results.DATA{which_animal}.results(which_file).date_num = date_num;
                
                
                ind = strfind(trial_log,'expression_masker_level');
                Params.masker_level(cnt) = str2num(trial_log(ind+27:ind+30));
                clear ind
                
                ind = strfind(trial_log,'target_level');
                Params.target_level(cnt) = str2num(trial_log(ind+15:ind+18));
                clear ind
                
                ind = strfind(trial_log,'score');
                ind2 = strfind(trial_log,'expression_phase_delay');
                Params.score{cnt} = trial_log(ind+9:ind2-3);
                clear ind ind2
                switch Params.score{cnt}
                    case 'HIT'
                        Params.scoreN(cnt) = 1;
                    case 'CR'
                        Params.scoreN(cnt) = 2;
                    case 'FA'
                        Params.scoreN(cnt) = 3;
                    case 'MISS'
                        Params.scoreN(cnt) = 4;
                    otherwise
                        Params.scoreN(cnt) = 5;
                end
                
                ind = strfind(trial_log,'Type');
                ind2 = strfind(trial_log,'Target attenuation');
                Params.ttype{cnt} = trial_log(ind+6:ind2-1);
                clear ind ind2
                switch Params.ttype{cnt}
                    case 'GO'
                        Params.ttypeN(cnt) = 1;
                    case 'NOGO'
                        Params.ttypeN(cnt) = 0;
                    case 'GO_REMIND'
                        Params.ttypeN(cnt) = 2;
                    otherwise
                        Params.ttypeN(cnt) = 3;
                end
                
                
            end
        end
        
        firstline = char(dataArray{1,2}(1));
        ind = strfind(firstline,'/data/');
        ind2 = strfind(firstline,'\');
        animal_id = firstline(ind+6:ind2-1);
        BIG_RESULTS_MATRIX.data = zeros(cnt,4);
        for which_trial = 1 : cnt
            BIG_RESULTS_MATRIX.ID = animal_id;
            BIG_RESULTS_MATRIX.data(which_trial,1) = Params.masker_level(which_trial);
            BIG_RESULTS_MATRIX.data(which_trial,2) = Params.target_level(which_trial);
            switch Params.scoreN(which_trial)
                case 1 %HIT
                    BIG_RESULTS_MATRIX.data(which_trial,3) = 1;%Go trial
                    BIG_RESULTS_MATRIX.data(which_trial,4) = 1;%correct
                case 2 %CR
                    BIG_RESULTS_MATRIX.data(which_trial,3) = 0;%NoGo trial
                    BIG_RESULTS_MATRIX.data(which_trial,4) = 1;%correct
                case 3 %FA
                    BIG_RESULTS_MATRIX.data(which_trial,3) = 0;%NoGo trial
                    BIG_RESULTS_MATRIX.data(which_trial,4) = 0;%incorrect
                    
                case 4 %MISS
                    BIG_RESULTS_MATRIX.data(which_trial,3) = 1;%Go trial
                    BIG_RESULTS_MATRIX.data(which_trial,4) = 0;%incorrect
                    
                otherwise
                    BIG_RESULTS_MATRIX.data(which_trial,3) = -1;
                    BIG_RESULTS_MATRIX.data(which_trial,4) = -1;
            end
        end
        
        clear TMR tmr pcorrect
        TMR = BIG_RESULTS_MATRIX.data(:,2) - BIG_RESULTS_MATRIX.data(:,1);
        tmrs = sort(unique(TMR));
        if ~isempty(tmrs)
            for which_tmr = 1 : length(tmrs)
                tmr_ind = find(TMR == tmrs(which_tmr));
                if which_tmr<length(tmrs)
                    pcorrect(which_tmr) = 100*length(find((BIG_RESULTS_MATRIX.data(tmr_ind,4)==1)&(BIG_RESULTS_MATRIX.data(tmr_ind,3)==1)))/length(tmr_ind);
                else
                    pcorrect(which_tmr) = 100*length(find((BIG_RESULTS_MATRIX.data(tmr_ind,4)==1)&(BIG_RESULTS_MATRIX.data(tmr_ind,3)==0)))/length(tmr_ind);
				end
			end
% 				filename
% 				tmrs'
% 				pcorrect
%             figure(which_animal);hold on; plot(-tmrs,pcorrect,'x-')
%             xlabel('TMR [dB]')
%             ylabel('Percent Correct')
%             title(animal_id)
        else
%             num2str(which_file)
            BIG_RESULTS_MATRIX.data = [];
        end
        
        Results.DATA{which_animal}.results(which_file).BIG_RESULTS_MATRIX  = BIG_RESULTS_MATRIX;
        
        %save(summary_file_name)
	end
    
end
fprintf('Saving results to %s\n', summary_file_name);
save(summary_file_name)

fprintf('Done\n');
