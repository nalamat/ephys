%% Import behavioral data from log file.
% Script for importing data from the following text file:
%
%    C:\Users\ihlefeld\Documents\x.log
%
% author: Antje Ihlefeld 2017/11/09 17:07:48
clear
close all
clc
want_readfile = 1;
if want_readfile == 1
    filename = 'CMR04Left\CMR04Left_PositiveCMR_20171109_172519.log';
    delimiter = ',';
    
    %% Read columns of data as text:
    formatSpec = '%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%[^\n\r]';
    
    %% Open the text file.
    fileID = fopen(filename,'r');
    
    %% Read columns of data according to the format.
    dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'TextType', 'string',  'ReturnOnError', false);
    
    %% Close the text file.
    fclose(fileID);
else
    load bla
end
cnt = 0;
for which_line = 1: length(dataArray{1,1})
    
    if ~isempty(strfind(dataArray{1,2}(which_line),'Trial log'))
        cnt = cnt + 1;
        trial_log = [];
        for which_ind = 1 : 72
            trial_log = [trial_log, char(dataArray{1,which_ind}(which_line))];
        end
        Trial_log{cnt} = trial_log;
        ind = strfind(trial_log,'expression_masker_level');
        Params.masker_level(cnt) = str2num(trial_log(ind+27:ind+30));
        clear ind
        
        ind = strfind(trial_log,'target_level');
        Params.target_level(cnt) = str2num(trial_log(ind+15:ind+18));
        clear ind
        
        ind = strfind(trial_log,'score');
        ind2 = strfind(trial_log,'expression_phase_delay');
        Params.score{cnt} = trial_log(ind+9:ind2-3);
        clear ind
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
        clear ind
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
        case 1%HIT
            BIG_RESULTS_MATRIX.data(which_trial,3) = 1;%Go trial
            BIG_RESULTS_MATRIX.data(which_trial,4) = 1;%correct
        case 2%CR
            BIG_RESULTS_MATRIX.data(which_trial,3) = 0;%NoGo trial
            BIG_RESULTS_MATRIX.data(which_trial,4) = 1;%correct
        case 3%FA
            BIG_RESULTS_MATRIX.data(which_trial,3) = 0;%NoGo trial
            BIG_RESULTS_MATRIX.data(which_trial,4) = 0;%incorrect
            
        case 4%MISS
            BIG_RESULTS_MATRIX.data(which_trial,3) = 1;%Go trial
            BIG_RESULTS_MATRIX.data(which_trial,4) = 0;%incorrect
            
        otherwise
            BIG_RESULTS_MATRIX.data(which_trial,3) = -1;
            BIG_RESULTS_MATRIX.data(which_trial,4) = -1;
            
    end
end

TMR = BIG_RESULTS_MATRIX.data(:,2) - BIG_RESULTS_MATRIX.data(:,1);
tmrs = sort(unique(TMR));
for which_tmr = 1 : length(tmrs)
    tmr_ind = find(TMR == tmrs(which_tmr));   
        if which_tmr<length(tmrs)
        pcorrect(which_tmr) = 100*length(find((BIG_RESULTS_MATRIX.data(tmr_ind,4)==1)&(BIG_RESULTS_MATRIX.data(tmr_ind,3)==1)))/length(tmr_ind);
        else
                    pcorrect(which_tmr) = 100*length(find((BIG_RESULTS_MATRIX.data(tmr_ind,4)==1)&(BIG_RESULTS_MATRIX.data(tmr_ind,3)==0)))/length(tmr_ind);
        end
end

figure;plot(-tmrs,pcorrect,'x-')
xlabel('TMR [dB]')
ylabel('Percent Correct')
title(animal_id)

