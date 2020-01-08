%%  spike sorting using ultramegasort

% set data file
dataPath = '../Data-Booth1-EARS/';
dataFile = ['CMR05Fluffy/' ...
'CMR05Fluffy-20190511-150044-MMR-Physiology-Passive-1kToneSupermasker.h5'];

channels = [1 3 6:15];
excludeNoisy = true;

% where to save sorted spikes
ext = strfind(dataFile,'.');
ext = ext(end)-1;
sortedFile = [dataFile(1:ext) '-spikes-single.mat'];

%% read traces of individual trials from data file
[trialView, fs, trialLog, version, noiseFloor] = ...
	readTrialView([dataPath dataFile], channels, [], excludeNoisy);

% adapt trial view to ultramegasort format
trials = size(trialView, 1);
channels = size(trialView, 2);
samples = length(trialView{1, 1});
trialView2 = zeros(trials, samples, channels);
for trialID = 1:trials
	for channelID = 1:channels
		trialView2(trialID, :, channelID) = trialView{trialID, channelID};
	end
end

%% run ultramegasort
rng(1); % random seed
spikes = ss_default_params(fs, 'thresh',3.9);
spikes = ss_detect(trialView2, spikes);
spikes = ss_align(spikes);
spikes = ss_kmeans(spikes);
spikes = ss_energy(spikes);
spikes = ss_aggregate(spikes);

% save initial clusters
extracted = true;
inspected = false;
analyzed = false;
save([dataPath sortedFile], 'spikes', 'dataFile', ...
	'extracted', 'inspected', 'analyzed');
return;

%% manually inspect clusters
splitmerge_tool(spikes)
return;

%% save manually inspected clusters
inspected = true;
save([dataPath sortedFile], 'spikes', 'dataFile', ...
	'extracted', 'inspected', 'analyzed');
return;



%% stand alone outlier tool
outlier_tool(spikes)

%%
plot_detection_criterion(spikes, 47)

%%
plot_st

%
% Note: In the code below, "clus", "clus1", "clus2", and "clus_list" are dummy
% variables.  The user should fill in these vlaues with cluster IDs found 
% in the SPIKES object after running the algorithm above.
%

%% plots for single clusters
plot_waveforms( spikes, clus );
plot_stability( spikes, clus);
plot_residuals( spikes,clus);
plot_isi( spikes, clus );
plot_detection_criterion( spikes, clus );

% comparison plots
plot_fld( spikes,clus1,clus2);
plot_xcorr( spikes, clus1, clus2 );

% whole data plots
plot_features(spikes );
plot_aggtree(spikes);
show_clusters(spikes, [clus_list]);
compare_clusters(spikes, [clus_list]);

% outlier manipulation (see M-files for description on how to use)
spikes = remove_outliers( spikes, which ); 
spikes = reintegrate_outliers( spikes, indices, mini );

% quality metric functions
%
% Note: There are versions of these functions in the quality_measures 
% directory that have an interface that does not depend on the SPIKES
% structure.  These are for use by people who only want to use the quality
% metrics but do not want to use the rest of the package for sorting. 
% These functions have the same names as below but without the "ss_" prefix.
%
FN1 = ss_censored( spikes, clus1 );
FP1 = ss_rpv_contamination( spikes, clus1  );
FN2 = ss_undetected(spikes,clus1);
confusion_matrix = ss_gaussian_overlap( spikes, clus1, clus2 ); % call for every pair of clusters


