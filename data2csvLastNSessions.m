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
% clc
MinNTrials = 10;% The minimal number of trials per condition
lastN = 50;%Counting backwards in time from the last session, how many sessions would you like to include in this analysis
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
desired_maskers = [4];%[7,8];%[3,6];%[7,8];%[1,5];%[3,6];

% masker_name2number = containers.Map({'tonal_mask_2000_04', ...
% 	'tonal_mask_4000_1', 'tonal_mask_2', 'Supermasker', ...
% 	'notched_noise_mask_2000_04', 'notched_noise_mask_2', ...
% 	'tonal_mask_2000_octave_1', 'notched_noise_mask_2000_octave_1'}, ...
% 	{1, 2, 3, 4, 5, 6, 7, 8});
% masker_number2name = containers.Map(masker_name2number.values, ...
% 	masker_name2number.keys);

for which_animal = 1 : size(Results.DATA,2)
    clear masker_type
	name = Params.IDs{which_animal};
    fh1(which_animal) = figure('name', [name ' percent correct']);
	fh1(which_animal).NumberTitle = 'off';
	fh2(which_animal) = figure('name', [name ' d prime']);
	fh2(which_animal).NumberTitle = 'off';
    
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
        elseif strcmp('tonal_mask_2000_octave_1',mtype)
            masker_type(which_session) = 7;
        elseif strcmp('notched_noise_mask_2000_octave_1',mtype)
            masker_type(which_session) = 8;
        else
            masker_type(which_session) = 9;
            disp(mtype)
        end
        
    end
    selected_sessions= [];
    new_session_numbers = [];
    for which_desired_masker = 1 : length(desired_maskers)
        ind = find(masker_type == desired_maskers(which_desired_masker));
		if isempty(ind)
            fprintf('No sessions found for %s animal and %d masker\n', Params.IDs{which_animal}, which_desired_masker);
            continue;
        end
        clear session_dates
        for which_ind = 1 : length(ind)
            session_dates(which_ind) = Results.DATA{1,which_animal}.results(ind(which_ind)).date_num;
        end
        [xx,ii] = sort(session_dates);
        if length(ii)>lastN
            ii = ii(end-lastN+1:end);
		end
        selected_sessions = [selected_sessions, ind(ii)];
        new_session_numbers = [new_session_numbers, (1 : length(ii)) + length(new_session_numbers)];
    end
	
	count = 0;
	fprintf('%s has %d sessions\n', Params.IDs{which_animal}, size(Results.DATA{1,which_animal}.results,2));
	fprintf('%d sessions will be analyzed\n', length(selected_sessions));
	
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
                    
                    figure(fh1(which_animal));
                    subplot(3,3,masker_type(selected_sessions(which_session)));
                    hold on; plot([ -tmrs; -30],[pcorrect fa],'x-')
                    xlabel('TMR [dB]')
                    ylabel('Percent Correct')
                    tmp = upper(mtype); tmp(strfind(tmp,'_'))=' ';
                    title(tmp)
                    
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
% 					fprintf('File  : %s-%s\n', Params.IDs{which_animal}, Results.DATA{1,which_animal}.results(selected_sessions(which_session)).date_str);
% 					fprintf('TMRs  : %s\n'   , num2str(tmrs'));
% 					fprintf('dPrime: %s\n\n' , num2str(dprime));

                    figure(fh2(which_animal));
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
% 					disp(masker_type(selected_sessions(which_session)));
                    
                    Extracted(which_animal).Results(new_session_numbers(which_session)).mtype = mtype;
                    
                end
                
                
            end
        else
            disp(['Session ',num2str(selected_sessions(which_session)),' contained no useful data']);
        end
        
        
	end
	
	% plot average d prime with error bars for each animal
	figure('name',[name ' average d prime']);
	set(gcf, 'numbertitle', 'off');
	for which_desired_masker = 1 : length(desired_maskers)
		results = Extracted(which_animal).Results;
		masker_type = desired_maskers(which_desired_masker);
		which_sessions = find([results.masker_type] == masker_type);

		% fetch all available tmrs
		tmrs = [];
		for which_session = which_sessions
			tmrs = [tmrs, results(which_session).tmr];
		end
		tmrs = sort(unique(tmrs));

		% group dprimes based on their tmr
		dprimes = cell(size(tmrs));
		for which_session = which_sessions
			for which_tmr = 1:length(results(which_session).tmr)
				tmr = results(which_session).tmr(which_tmr);
				which_tmr2 = find(tmrs == tmr);
				dprimes{which_tmr2} = [dprimes{which_tmr2}, ...
					results(which_session).dprime(which_tmr)];
			end
		end

		% calculate average, standard deviation and standard error of mean
		% for dprimes of each tmr condition
		dprimes_avg = zeros(size(dprimes));
		dprimes_std = zeros(size(dprimes));
		dprimes_sem = zeros(size(dprimes));
		for i = 1:length(dprimes)
			dprimes_avg(i) = mean(dprimes{i});
			dprimes_std(i) = std(dprimes{i});
			dprimes_sem(i) = std(dprimes{i})/sqrt(length(dprimes{i})-1);
		end

		% line plot with error bars
		subplot(3,3,masker_type);
		errorbar(tmrs, dprimes_avg, dprimes_sem);
		xlabel('TMR [dB]')
		ylabel('d prime')
		mtype = results(which_sessions(1)).mtype;
		tmp = upper(mtype); tmp(strfind(tmp,'_'))=' ';
		title(tmp)
	end
	
	
	fprintf('%d sessions were analyzed\n', count);
    
end
fclose(fid);
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
% 			if which_masker ~=2 , keyboard;end
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
figure('name','Summary')
set(gcf, 'numbertitle', 'off');
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