%--------------------------------------------------------------------------
% data2csvLastNSessions.m
%--------------------------------------------------------------------------
%
% uses Results cell array from read_behavior_data.m and converts it into
% csv, and converts results into percent correct and d' 
% plots results
% plots across-gerbil average d'
%--------------------------------------------------------------------------
% Antje Ihlefeld Jan 2018
%--------------------------------------------------------------------------

%% Initialization:
%  ---------------
clear
close all
clc
MinNTrials = 15;% The minimal number of trials we require
lastN = 15;%Counting backwards in time from the last session, how many sessions would you like to include in this analysis
TMRthresh = -50;%exclude all TMRs smaller than TMRthresh
Results_filename='CMR04Data.mat';
load(Results_filename,'Params','Results')

Output_filename = 'CMR04DataOnlyGo_sel.csv';

fid = fopen(Output_filename, 'w') ;
fprintf(fid, '%s, ', 'Session') ;
fprintf(fid, '%s, ', 'NewSessionNumber') ;
fprintf(fid, '%s, ', 'MaskerNo');
fprintf(fid, '%s, ', 'Masker');
fprintf(fid, '%s, ', 'SNR');
fprintf(fid, '%s, ', 'TrialType') ;
fprintf(fid, '%s, ', 'score') ;
fprintf(fid, '%s\n', 'Subject') ;
desired_maskers = [1,5];%[1,5];%[3,6];
MinNTrials = 10;%minimum number of trials per condition

for which_animal = 1 : size(Results.DATA,2)
    clear masker_type
    fh(which_animal) = figure(which_animal);
	
	count = 0;
	fprintf('%s: %d sessions to analyze\n', Params.IDs{which_animal}, size(Results.DATA{1,which_animal}.results,2));
    
    for which_session = 1 : size(Results.DATA{1,which_animal}.results,2)
        mtype = Results.DATA{1,which_animal}.results(which_session).masker_type;
        if strcmp('tonal_mask_2000_04',mtype)
            masker_type(which_session) = 1;
        elseif strcmp('tonal_mask_4000_1',mtype)
            masker_type(which_session) = 2;
        elseif strcmp('tonal_mask_2',mtype)
            masker_type(which_session) = 3;
        elseif strcmp('Supermasker',mtype)
            masker_type(which_session) = 4;
        elseif strcmp('notched_noise_mask_2000_04',mtype)
            masker_type(which_session) = 5;
        elseif strcmp('notched_noise_mask_2',mtype)
            masker_type(which_session) = 6;
        else
            masker_type(which_session) = 7;
            disp(mtype)
        end
        
    end
    selected_sessions= [];
    new_session_numbers = [];
    for which_desired_masker = 1 : length(desired_maskers)
        ind = find(masker_type == desired_maskers(which_desired_masker));
        clear session_dates
        for which_ind = 1 : length(ind)
            session_dates(which_ind) = Results.DATA{1,which_animal}.results(ind(which_ind)).date_num;
        end
        [xx,ii] = sort(session_dates);
        if length(ii)>lastN
            ii = ii(end-lastN+1:end);
        end
        selected_sessions = [selected_sessions, ind(ii)];
        new_session_numbers = [new_session_numbers, 1 : length(ii)];
    end
    for which_session = 1 : length(selected_sessions)%1 : size(Results.DATA{1,which_animal}.results,2)
        mtype = Results.DATA{1,which_animal}.results(selected_sessions(which_session)).masker_type;
        BIG_RESULTS_MATRIX = Results.DATA{1,which_animal}.results(selected_sessions(which_session)).BIG_RESULTS_MATRIX;
        if ~isempty(BIG_RESULTS_MATRIX.data)
            clear TMR tmrs pcorrect gotrials
            TMR = BIG_RESULTS_MATRIX.data(:,2) - BIG_RESULTS_MATRIX.data(:,1);
            TMR(TMR>100)=100;
            
            tmrs = sort(unique(TMR));
            tmrs(tmrs<-40) =[];
            if length(tmrs)>1
                for which_tmr = 1 : length(tmrs)
                    tmr_ind = find(TMR == tmrs(which_tmr));
                    if which_tmr<length(tmrs)
                        pcorrect(which_tmr) = 100*length(find((BIG_RESULTS_MATRIX.data(tmr_ind,4)==1)&(BIG_RESULTS_MATRIX.data(tmr_ind,3)==1)))/length(tmr_ind);
                        gotrials(which_tmr) = length(tmr_ind);
                    else
                        fa = 100*length(find((BIG_RESULTS_MATRIX.data(tmr_ind,4)==0)&(BIG_RESULTS_MATRIX.data(tmr_ind,3)==0)))/length(tmr_ind);
                        nogotrials = length(tmr_ind);
                        
                    end
                end
                
                if sum(masker_type(selected_sessions(which_session))==desired_maskers)>0
                    for which_trial = 1 :length(TMR)
                        if-TMR(which_trial)>TMRthresh
                            if BIG_RESULTS_MATRIX.data(which_trial,3)==1%only Go trials
                                fprintf(fid, '%f, ', selected_sessions(which_session)) ;
                                fprintf(fid, '%f, ', new_session_numbers(which_session)) ;
                                
                                fprintf(fid, '%f, ', masker_type(selected_sessions(which_session))) ;
                                fprintf(fid, '%s, ', mtype) ;
                                
                                fprintf(fid, '%f, ', -TMR(which_trial)) ;
                                fprintf(fid, '%f, ', BIG_RESULTS_MATRIX.data(which_trial,3)) ;%trial type
                                fprintf(fid, '%f, ', BIG_RESULTS_MATRIX.data(which_trial,4)) ;%score
                                fprintf(fid, '%s\n', BIG_RESULTS_MATRIX.ID) ;% animal id
                            else %NoGo wrong = FalseAlarm
                                fprintf(fid, '%f, ', selected_sessions(which_session)) ;
                                fprintf(fid, '%f, ', new_session_numbers(which_session)) ;
                                
                                fprintf(fid, '%f, ', masker_type(selected_sessions(which_session))) ;
                                fprintf(fid, '%s, ', mtype) ;
                                
                                fprintf(fid, '%f, ', -50);%-TMR(which_trial)) ;
                                fprintf(fid, '%f, ', BIG_RESULTS_MATRIX.data(which_trial,3)) ;%trial type
                                if BIG_RESULTS_MATRIX.data(which_trial,4)==1
                                    fprintf(fid, '%f, ', 0) ;%score
                                else
                                    fprintf(fid, '%f, ', 1) ;%score
                                end
                                fprintf(fid, '%s\n', BIG_RESULTS_MATRIX.ID) ;% animal id
                            end
                        end
                    end
                    
                    tmrs(end)=[];
                    
                    figure(fh(which_animal));
                    tmp = BIG_RESULTS_MATRIX.ID; tmp(strfind(tmp,'_'))=' ';
                    set(fh(which_animal),'name',tmp);
                    subplot(3,3,masker_type(selected_sessions(which_session)));
                    hold on; plot([ -tmrs; -30],[pcorrect fa],'x-')
                    xlabel('TMR [dB]')
                    ylabel('Percent Correct')
                    title(upper(mtype))
                    
					hr = pcorrect/100;
					far = fa/100;
					hr(hr>0.99) = 0.99;
					far(far>0.99) = 0.99;
					hr(hr<0.01) = 0.01;
					far(far<0.01) = 0.01;

					% calculate the z-scores
					zh = erfinv(1-2.*(1-hr)).*sqrt(2);
					zf = erfinv(1-2.*(1-far)).*sqrt(2);
					dprime = zh-zf;
					
					count = count + 1;
% 					fprintf('File  : %s-%s\n', BIG_RESULTS_MATRIX.ID, Results.DATA{1,which_animal}.results(selected_sessions(which_session)).date_str);
% 					fprintf('TMRs  : %s\n'   , num2str(tmrs'));
% 					fprintf('dPrime: %s\n\n' , num2str(dprime));
					
                    figure(100+which_animal);
                    subplot(3,3,masker_type(selected_sessions(which_session)));
                    hold on; plot([ -tmrs],[dprime],'x-')
                    xlabel('TMR [dB]')
                    ylabel('d prime')
                    tmp = upper(mtype); tmp(strfind(tmp,'_'))=' ';
                    title(tmp)
                    
                    if length(dprime)~=length(gotrials)
                        keyboard
                    end
                    
                    Extracted(which_animal).Results(new_session_numbers(which_session)).dprime = dprime;
                    Extracted(which_animal).Results(new_session_numbers(which_session)).fa = fa;
                    Extracted(which_animal).Results(new_session_numbers(which_session)).nGotrials = gotrials;
                    Extracted(which_animal).Results(new_session_numbers(which_session)).nNoGotrials = nogotrials;
                    
                    Extracted(which_animal).Results(new_session_numbers(which_session)).tmr = -tmrs';
                    Extracted(which_animal).Results(new_session_numbers(which_session)).original_sessionno = selected_sessions(which_session);
                    Extracted(which_animal).animal_id = BIG_RESULTS_MATRIX.ID;
                    Extracted(which_animal).Results(new_session_numbers(which_session)).masker_type = masker_type(selected_sessions(which_session));
                    
                    Extracted(which_animal).Results(new_session_numbers(which_session)).mtype = mtype;
                    
				end
			end
			
        else
            disp(['Session ',num2str(selected_sessions(which_session)),' contained no useful data']);
        end
        
        
	end
	
	fprintf('%s: %d sessions were analyzed\n', Params.IDs{which_animal}, count);
    
end
fclose(fid)
save('PelinDataExtracted.mat');


stepsize = 5;
tmr_range = -20 : stepsize : 40;
OverallDprime = zeros(size(Extracted,2),length(desired_maskers),length(tmr_range));
OverallNSessions = zeros(size(Extracted,2),length(desired_maskers),length(tmr_range));

for which_animal = 1 : size(Extracted,2)
    
    
    overall_dprime = zeros(length(desired_maskers),length(tmr_range));
    session_cnt = zeros(length(desired_maskers),length(tmr_range));
    
    for which_session = 1 :size(Extracted(which_animal).Results,2)
        if ~isempty(Extracted(which_animal).Results(which_session).masker_type)
            which_masker = find(Extracted(which_animal).Results(which_session).masker_type==desired_maskers);
        else which_masker = [];
        end
        if ~isempty(which_masker)
            dprime = Extracted(which_animal).Results(which_session).dprime;
            tmr = round(Extracted(which_animal).Results(which_session).tmr);
            
            nGotrials = Extracted(which_animal).Results(which_session).nGotrials;
            dprime = dprime(nGotrials>MinNTrials);
            tmr = tmr(nGotrials>MinNTrials);
            tmr = ceil(tmr/stepsize)*stepsize;
            for which_tmr = 1 : length(tmr)
                ind2 = find(tmr_range == tmr(which_tmr));
                overall_dprime(which_masker,ind2) = overall_dprime(which_masker,ind2) + dprime(which_tmr);
                session_cnt(which_masker,ind2) = session_cnt(which_masker,ind2) + 1;
            end
        end
    end
    OverallDprime(which_animal,:,:) = overall_dprime./session_cnt;
    OverallNSessions(which_animal,:,:)  = session_cnt;
end
figure('name','summary')
for which_masker = 1 : size(OverallDprime,2)
    tmp = squeeze(OverallDprime(:,which_masker,:));
    u = nanmean(tmp);
    se = sqrt(nanstd(tmp))/size(Extracted,2);
    hold on;h = errorbar(tmr_range,u,se);
    set(h,'linewidth',2)
    xlabel('TMR [dB]')
    ylabel('d prime')
    xlim([-15 35])
    ylim([0 4])
end
legend({'IM';'EM'})
set(gca,'fontsize',16,'ytick',[0:1:4])
set(gcf,'position',[440   537   254   261])