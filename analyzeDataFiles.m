%% analyze raw physiology traces from data files

% read data from several files using readTrialView
% select the relevant elctrode numbers you are interested in
% select the trial type - Frequency and Intensity for a given masker type
% perform spike detection using voltage thresholding
% calculate ISI inter-arrival time for the spikes
% calculate mean firing rate for each session and stores it in a .mat file
% NYU data fs: 24414.0625
% NJIT data fs: 31250.0
%
% coding of conditions:
% condID trialType targetFreq targetLevel
%   1      NOGO        -          -
%   2       GO         1          50
%   3       GO         1          60
%   4       GO         1          70
%   5       GO         2          50
%   6       GO         2          60
%   7       GO         2          70
%
% coding of scores:
%  scoreID   trialType    score
%    1          GO       HIT+MISS
%    2          GO         HIT
%    3          GO         MISS
%    1         NOGO       CA+FA
%    2         NOGO        CA
%    3         NOGO        FA

% check if all required files are accessible
if ~exist('mtspectrumpt' , 'file'); error(['Make sure the Chronux '     ...
	'package is installed (http://chronux.org)'      ]); end
if ~exist('readTrialLog' , 'file'); error(['Make sure readTrialLog.m '  ...
	'exists in the same folder as the current script']); end
if ~exist('readTrialView', 'file'); error(['Make sure readTrialView.m ' ...
	'exists in the same folder as the current script']); end
if ~exist('analyzeUnits'  , 'file'); error(['Make sure analyzeUnits.m '   ...
	'exists in the same folder as the current script']); end
if ~exist('histogramFit' , 'file'); error(['Make sure histogramFit.m '  ...
	'exists in the same folder as the current script']); end
if ~exist('rayleighsz'   , 'file'); error(['Make sure rayleighsz.m '    ...
	'exists in the same folder as the current script']); end

warning('off', 'MATLAB:imagesci:deprecatedHDF5:warnBitfieldNotSupported');

% NOTE: set the data path, animal name and data files before running
source = 'njit';
% source = 'nyu';

if strcmpi(source, 'njit')
	analysisPath = 'AnalysisNJIT/%s-0610.mat';
	animalNames  = {
% 		'CMR04Tail'
% 		'CMR02Head'
% 		'CMR05Fluffy'
		'CMR05Tail'
		};
	
elseif strcmpi(source, 'nyu')
	analysisPath = 'AnalysisNYU/%s.mat';
	dataPath     = '../../antje/MMRPhysiology/';
	animalNames  = {
		'BackF5'
		'BackM4'
		'CMRphys'
		'first_data'
		'FluffyM4'
		'HeadM_G1'
		'LeftF8'
		'RightF1'
		'RightM7'
		'TailF1'
		};
else
	error('Invalid `source`');
end

excludeNoisy = true;
viewBounds = [-1, 2];    % seconds before and after tone onset to analyze
% scores = {'ALL', 'CR', 'FA';
% 	'ALL', 'HIT', 'MISS'};

animalID = 1;    % for resume capability
fileID   = 1;    % for resume capability


%% loop through all animals
% try

for animalID = animalID:length(animalNames)
	animalName = animalNames{animalID};
	
	if strcmpi(source, 'njit')
		getFilesNJIT;
		
	elseif strcmpi(source, 'nyu')
		dataFiles = {};
		excludeTrials = {};
		channels = {};
		
		% iterate through all recorded sessions at NYU and select the
		% ones from the current animal
		for which_session = 1:607
			getFilesNYU;

			tokens = strsplit(general_path, '\');

			if ~strcmp(tokens{end-1}, animalName); continue; end

			for i = 1:length(extracted_filenames)
				file = extracted_filenames{i};
				file = file(length(general_path)+1:end);
				if regexp(file, '\.hd5$'); file = file(1:end-4); end
				if regexp(file, '_extracted$'); file = file(1:end-10); end
				file = [tokens{end-1}, '\', tokens{end}, '\', file];

				if exist([dataPath, file, '.hd5'], 'file')
					file = [file, '.hd5'];
				elseif exist([dataPath, file, '_raw.hd5'], 'file')
					file = [file, '_raw.hd5'];
				else
					continue;
				end

				dataFiles{end+1} = file;
				excludeTrials{end+1} = ExcludeTrial{i};
				channels{end+1} = Electrodes{i};
			end
		end   % which_session
		
	end
	
	% all analysis are stored in this cell array of structs
	% that will also be saved on disk
	analysis = cell(size(dataFiles));
	analysisFile = sprintf(analysisPath, animalName);

	fprintf('%d files for %s to analyze\n', length(dataFiles), animalName);


	%% loop through all data files
	% RESUME FROM HERE
	for fileID = fileID:length(dataFiles)
		if length(excludeTrials) < fileID; excludeTrials2 = [];
		else; excludeTrials2 = excludeTrials{fileID}; end
		
		if ~iscell(channels); channels2 = channels;
		elseif length(channels) < fileID; excludeTrials2 = 'all';
		else; channels2 = channels{fileID}; end
		
		a               = struct();    % data struct
		a.animalName    = animalName;
		a.dataPath      = dataPath;
		a.dataFile      = dataFiles{fileID};
		a.channels      = channels2;
		a.excludeTrials = excludeTrials2;
		a.excludeNoisy  = excludeNoisy;
		a.viewBounds    = viewBounds;

		fprintf('Analyzing file %d/%d: %s\n', fileID, ...
			length(dataFiles), a.dataFile);
		
		[sp, a] = extractSpikes(a);
		
		a = spikesToUnits(sp, a, 'multi');
		
		a.units = analyzeUnits(a.units);

		% store analysis struct in analysis cell array
		analysis{fileID} = a;

		% save progress every 50 files
		if mod(fileID, 50)==0
			fprintf('Saving analysis to %s\n', analysisFile);
			save(analysisFile, 'analysis', 'fileID', '-v7.3');
		end
	end % fileID

	% finally save the key parameters for each trial type in a .mat file.
	fprintf('Saving analysis to %s\n', analysisFile);
	save(analysisFile, 'analysis', 'fileID', '-v7.3'); % -v7, -v7.3
	
	fileID = 1;

end % animalID

fprintf('Done\n');
if exist('notify'); notify('Completed "analyzeFiles.m"'); end

% catch err
% 	try if exist('notify'); notify('Error in "analyzeFiles.m"'); end
% 	catch; end
% 	rethrow(err);
% end

