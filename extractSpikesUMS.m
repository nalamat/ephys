function [spikes, analysis] = extractSpikesUMS(analysis, ...
	spikeConfig, excludeNoisy, viewBounds)
% spike sorting using ultramegasort

	if ~iscell(analysis)
		analysis = {analysis};
	end
	
	if ~exist('spikeConfig', 'var'); spikeConfig = ''; end
	if ~exist('excludeNoisy', 'var'); excludeNoisy = true; end
	if ~exist('viewBounds', 'var'); viewBounds = [-1, 2]; end
	
	if ~any(strcmpi(spikeConfig, {'', 'sorted', 'joint', 'sortedjoint'}))
		error('Invalid "spikeConfig"');
	end
	
	trialView = [];

	for analysisID = 1:length(analysis)
		a = analysis{analysisID}; % unpack
		
		a.excludeNoisy = excludeNoisy;
		a.viewBounds = viewBounds;

		fprintf('Loading data file: %s\n', a.dataFile);
		
		% read traces of individual trials from data file
		[trialView2, a] = readTrialView(a);

		% adapt trial view to ultramegasort format
		trials = size(trialView2, 1);
		channels = size(trialView2, 2);
		samples = length(trialView2{1, 1});
		trialView3 = cell2mat(trialView2);
		trialView3 = reshape(trialView3, samples, trials, channels);
		% UMS format: trials x samples x channels
		trialView3 = permute(trialView3, [2 1 3]);
		
		trialView = [trialView; trialView3];
		
		analysis{analysisID} = a; % pack
	end % analysisID
	
	if any(strcmpi(spikeConfig, {'joint', 'sortedjoint'}))
		fprintf('Running UltraMegaSort jointly on all channels\n');
		
		rng(1); % random seed
		sp = ss_default_params(analysis{1}.fs, 'thresh',3.9);
		sp = ss_detect(trialView, sp);
		sp = ss_align(sp);
		sp = ss_kmeans(sp);
		sp = ss_energy(sp);
		sp = ss_aggregate(sp);
		
		spikes = sp;
	else
		channels = analysis{1}.channels;
		spikes = cell(1, length(channels));
		for channelID = 1:length(channels)
			fprintf('Running UltraMegaSort for channel %d\n', ...
				channels(channelID));

			trialView4 = trialView(:,:,channelID);
			trialView4 = num2cell(trialView4, [2 3]);
			trialView4 = cellfun(@transpose, trialView4, ...
				'uniformoutput',false);

			rng(1); % random seed
			sp = ss_default_params(analysis{1}.fs, 'thresh',3.9);
			sp = ss_detect(trialView4, sp);
			sp = ss_align(sp);
			sp = ss_kmeans(sp);
			sp = ss_energy(sp);
			sp = ss_aggregate(sp);
			
			spikes{channelID} = sp;
		end % channels
	end
end
