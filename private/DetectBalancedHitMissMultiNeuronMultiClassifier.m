function DetectBalancedHitMissMultiNeuronMultiClassifier(file_in,Type,time1,time2)


%% debug
 debug=0;


 
%% load auditory neuron files
if(Type == 'A')
  if(file_in(end) == '1')
    load A1_AuditoryNeurons
    NumberOfNeurons=[1 2 3 10 20 50 100 130];
  else
    load AL_AuditoryNeurons
    NumberOfNeurons=[1 2 3 10 20 50 100 130];
  end
  AuditoryNeurons=Aud;
elseif (Type == 'E')
  if(file_in(end) == '1')
    load A1_AuditoryNeuronsE
    NumberOfNeurons=[1 2 3 10 20 50 100];
  else
    load AL_AuditoryNeuronsE
    NumberOfNeurons=[1 2 3 10 20 50 100];
  end
  AuditoryNeurons=AudE;
else
  if(file_in(end) == '1')
    load A1_AuditoryNeuronsI
    NumberOfNeurons=[1 2 3 10 20 30];
  else
    load AL_AuditoryNeuronsI  
    NumberOfNeurons=[1 2 3 10 20 40];
  end
  AuditoryNeurons=AudI;
end

%% setup
close all;
clear dataC;
global dataC;
disp(file_in)
load(file_in);
TNRs = (60:5:85)';
nTNR = numel(TNRs);


% setup for parameters used
xmin = 0;
xmax = 500;
sl_bin = 250;
bin = 250;
xax = (xmin:sl_bin:xmax)';
xax(:,2) = xax+bin;


%% Load files & extract data

% get column indices first
corr = find(strcmp('error_LV', dataC.codes.name),1);
TNRr = find(strcmp('TNR_LV', dataC.codes.name),1);
sess = find(strcmp('sess', dataC.codes.name),1);
stim = find(strcmp('stim1', dataC.codes.name),1);
levr = find(strcmp('lev_rel',dataC.codes.name),1);

% extract data
cor = dataC.codes.data(:,corr);
TNR = dataC.codes.data(:,TNRr);
ses = dataC.codes.data(:,sess);
stm = dataC.codes.data(:,stim);
lvr = dataC.codes.data(:,levr);

% extract spikes
spk_t = dataC.spikes;
spk = spk_t(:,2);
ss = unique(dataC.codes.data(:,11));


NumAuditoryNeurons=length(AuditoryNeurons); %AuditoryNeurons has the indices to the auditory neurons
%% Run the analysis 


LoopNumber=100;
Performance=NaN*ones(length(NumberOfNeurons),LoopNumber);
for non=1:length(NumberOfNeurons) %number of simultaneously looking at  
  for NumLoops=1:LoopNumber  
    ComboList=randsample(NumAuditoryNeurons,NumberOfNeurons(non));     
    UberRate=[];UberLabel=[];
    for iii= 1:NumberOfNeurons(non) %number of neurons in combination 
      disp(['ComboList of ' num2str(NumberOfNeurons(non)) ' :'  num2str(AuditoryNeurons(ComboList(iii,1))) ' for loop #' num2str(NumLoops)]);  
      i = ComboList(iii,1); %neuron ID
      i = AuditoryNeurons(i); %AuditoryNeurons has the indices to the auditory neuron
      % distributions - this includes both correct and error trial
      iSes = ses==ss(i); %references master list of auditory and non-auditory neurons
      
      % NEURAL Extract stuff required
      spk_Ses = spk(iSes);
      TNR_Ses = TNR(iSes);
      stm_Ses = stm(iSes);
      lvr_Ses = lvr(iSes);
      cor_Ses = cor(iSes);
          
      % align all to stim on and then get spike rates from all trials in session
      for j = 1:numel(stm_Ses)
        % align to stim on
        spk_Ses{j} = spk_Ses{j}-stm_Ses(j);
        spk_Ses{j} = spk_Ses{j}.*1000; % convert to ms
      end
      
      % Create selection arrays
      HitSpikes = cell(nTNR,1);
      for j=1:nTNR
       HitSpikes{j} = spk_Ses(TNR_Ses==TNRs(j)& cor_Ses==0); %hits 
       MissSpikes{j} = spk_Ses(TNR_Ses==TNRs(j) & cor_Ses~=0); %for misses only 
      end
      
      
      dataTnRSpikeRate=[];
      labelTnRSpikeRate=[];
      for n = 1:nTNR
        for m = 1:size(HitSpikes{n},1)
          dataTnRSpikeRate=[ dataTnRSpikeRate (sum(HitSpikes{n}{m}>=time1 & HitSpikes{n}{m}<=time2)).*(1000/bin)];
          labelTnRSpikeRate=[labelTnRSpikeRate 1];
        end
      end %n = 1:nTNR 
      
      for n = 1:nTNR
        for m = 1:size(MissSpikes{n},1)
          dataTnRSpikeRate=[ dataTnRSpikeRate (sum(MissSpikes{n}{m}>=time1 & MissSpikes{n}{m}<=time2)).*(1000/bin)];
          labelTnRSpikeRate=[labelTnRSpikeRate 2];
        end
      end %n = 1:nTNR 
      
      
      %now zscore and save in a temporary file
      dataTnRSpikeRate=(dataTnRSpikeRate-nanmean(dataTnRSpikeRate))./nanstd(dataTnRSpikeRate);
      eval(['datafoo' num2str(iii) '=dataTnRSpikeRate;']) %save in holding file
      eval(['labelfoo' num2str(iii) '=labelTnRSpikeRate;'])% ditto 
    end %for iii= 1:NumberOfNeurons   
    
    %now that have spikes and labels for NumSimultaneously, need to combine together into an
    %want to create a matrix where columns are number of neurons and rows
    %represent the minimum number of each class
    
    disp(['Balancing....'])
    BalanceLabel=[];
    for nt=1:2
      for iiii=1:NumberOfNeurons(non) %each neuron   
        eval(['lfoo=labelfoo' num2str(iiii) ';']);
        BalanceLabel=[BalanceLabel length(find(lfoo==nt))];
      end
    end
    BalanceLabel=min(BalanceLabel); %find minimum balanced number across all conditions
    
    RowHolder=1;
    for nt=1:2 
      for ml=1:BalanceLabel
        for iiii=1:NumberOfNeurons(non) %now go back and build matrix
          eval(['lfoo=labelfoo' num2str(iiii) ';']); 
          eval(['dfoo=datafoo' num2str(iiii) ';']); 
          idx=find(lfoo==nt); %indices of tnr=nt
          UberRate(RowHolder,iiii)= dfoo(idx(randperm(length(idx),1))); %randomly pick [w/ replacement] a firing rate at the tnr
          UberLabel(RowHolder,1)=nt;
        end
        RowHolder=RowHolder+1;
      end
    end
    
   %now do classification
   disp(['Classifying....'])
   opts = '-s 0 -t 0 -c 1';   ;    %# libsvm training options
   nfold = 10;
   [mean_acc std_acc] = libsvmcrossval_ova(UberLabel, UberRate, opts, nfold);  
   Performance(non,NumLoops)=mean_acc; 
  end %for NumLoops
end %for NumSimultaneously=NumberOfNeurons


eval(['save DetectPerformanceBalancedHitsMisses_' file_in '_' Type '_' num2str(time1) '_' num2str(time2)   '.mat Performance'])


end %function


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%          FUNCTIONS TO DO CLASSIFICATION
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [mean_acc std_acc] = libsvmcrossval_ova(y, X, opts, nfold, indices)
    if nargin < 3, opts = ''; end
    if nargin < 4, nfold = 10; end
    if nargin < 5, indices = crossvalidation(y, nfold); end

    %# N-fold cross-validation testing
    acc = zeros(nfold,1);
    for i=1:nfold
        testIdx = (indices == i); trainIdx = ~testIdx;
        mdl = libsvmtrain_ova(y(trainIdx), X(trainIdx,:), opts);
        [~,acc(i)] = libsvmpredict_ova(y(testIdx), X(testIdx,:), mdl);
    end
    mean_acc = mean(acc);    %# average accuracy
    std_acc  = std(acc);
end


function indices = crossvalidation(y, nfold)
    %# stratified n-fold cros-validation
    %#indices = crossvalind('Kfold', y, nfold);  %# Bioinformatics toolbox
    cv = cvpartition(y, 'kfold',nfold);          %# Statistics toolbox
    indices = zeros(size(y));
    for i=1:nfold
        indices(cv.test(i)) = i;
    end
end

function mdl = libsvmtrain_ova(y, X, opts)
    if nargin < 3, opts = ''; end

    %# classes
    labels = unique(y);
    numLabels = numel(labels);

    %# train one-against-all models
    models = cell(numLabels,1);
    for k=1:numLabels
        models{k} = svmtrain(double(y==labels(k)), X, strcat(opts,' -b 1 -q'));
    end
    mdl = struct('models',{models}, 'labels',labels);
end

function [pred,acc,prob] = libsvmpredict_ova(y, X, mdl)
    %# classes
    labels = mdl.labels;
    numLabels = numel(labels);

    %# get probability estimates of test instances using each 1-vs-all model
    prob = zeros(size(X,1), numLabels);
    for k=1:numLabels
        [~,~,p] = svmpredict(double(y==labels(k)), X, mdl.models{k}, '-b 1 -q');
        prob(:,k) = p(:, mdl.models{k}.Label==1);
    end

    %# predict the class with the highest probability
    [~,pred] = max(prob, [], 2);
    %# compute classification accuracy
    acc = mean(pred == y);
end


    
    
    

    
  




