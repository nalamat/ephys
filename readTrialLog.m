% Extract trial logs from HDF5 or LOG files into an array of structs.
% Compatible with data collected at NYU and NJIT using Neurobehavior
% and EARS software.
%
% In args:
%     arg1 = file (char array):
%         HDF5 or LOG file to be read.
%     or
%     arg1 = a (struct):
%         Must have:
%         - dataPath: Relative or absolute path of data folder
%         - dataFile: Concatenated to dataPath to obtain full file path.
%
% Out args:
%     a (struct):
%         - trialLog (array of structs): Trial by trial set of values and
%           parameters
%         - version (char array): One of the following values:
%           'ears', 'neurobehavior@njit', 'neurobehavior@nyu'
%         - rootGroup (char array): The HDF5 root group which contains the
%           most number of trials (only for Neurobehavior).
%
% TODO: performance table for neurobehavior (nyu and njit)
% TODO: include different targetDuration in condCount as well
function a = readTrialLog(arg1)
	% set a sample file for testing
	if ~exist('arg1', 'var')
% 		arg1 = ['../../antje/MMRPhysiology/TailF1/May22/' ...
% 			'aibehavphys1012_May22_TailF1_UnmodActivep1_raw.hd5'];
		arg1 = ['../Data-Booth1/CMR03Left/CMR03Left_PositiveCMR' ...
			'_20180718_173603_Passive_Supermasker50dB_1kTone75dB' ...
			'_Small_Booth.h5'];
% 		arg1 = ['../Data-Booth1-EARS/CMR03Left/' ...
% 			'CMR03Left-20180809-142208-MMR-Physiology.h5'];
	end
	
	% setup analysis struct
	if ischar(arg1) || isstring(arg1)
		arg1 = char(arg1);
		a = struct();
		a.dataPath = '';
		a.dataFile = arg1;
		file = arg1;
	elseif isstruct(arg1)
		a = arg1;
		if ~isempty(a.dataPath) && ...
				~any(strcmpi(a.dataPath(end), {'/','\\'}))
			a.dataPath = [a.dataPath '/'];
		end
		file = [a.dataPath a.dataFile];
	else
		error('[readTrialLog] invalid input');
	end
	
	a.type = 'datafile';
	
	% strip file extension
	[filepath, name, ext] = fileparts(file);
	
	if strcmp(ext, 'log')
		logFile = file;
	else
		logFile = sprintf('%s/%s%s', filepath, name, '.log');
	end
	
	% root group is only set for Neurobehavior data
	a.rootGroup = '';
	a.trialLog  = [];   % will be array of structs
	a.performance = []; % will be struct of arrays
	
	if ~strcmp(ext, '.log') && exist(file, 'file')
		% read hdf5 file info
		info = h5info(file);
		
		% EARS
		if any(strcmp('/log', {info.Groups.Name}))
			a.version  = 'ears';
			a.trialLog = h5read(file, '/log/trial');
			a.performance = h5read(file, '/log/performance');
			if isempty(a.trialLog.trialStart); a.trialLog = []; end
			
		% Neurobehavior@NYU
		else
			a.version = 'neurobehavior@nyu';
			if length(info.Groups) >= 1
				a.rootGroup = info.Groups(1).Name;
			end
			% find the session with maximum trial count
			trialCount = 0;
			for i = 1:length(info.Groups)
				try
					rootGroup2 = info.Groups(i).Name;
					trialLog2  = h5read(file, [rootGroup2, ...
						'/data/trial_log']);
					trialCount2 = length(trialLog2.start);
					if trialCount < trialCount2
						a.rootGroup = rootGroup2;
						trialCount = trialCount2;
						a.trialLog = trialLog2;
					end
				catch
				end
			end
		end
		
		% h5read creates a struct of arrays which is not very convenient
		% to deal with, instead, convert it to an array of structs
		if ~isempty(a.trialLog)
			a.trialLog = structofarrays2arrayofstructs(a.trialLog);
		end
		% no need to convert performance table to array of structs
	end
	
	% Neurobehavior@NJIT
	if isempty(a.trialLog) && exist(logFile, 'file')
		a.version = 'neurobehavior@njit';
		
		% resort to the log file
		fid = fopen(logFile);
		lineNumber = 1;
		a.trialLog = [];

		while ~feof(fid)
			line = fgetl(fid);
			tokens = regexp(line, 'INFO - Trial log: ({.*})', 'tokens');

			if isempty(tokens) || isempty(tokens{1})
				continue;
			elseif length(tokens)>2 || length(tokens{1})>2
				error('More than two matches found on line %d?!', ...
					lineNumber);
			end

	% 		disp(tokens{1}{1});
			token = tokens{1}{1};
			token = strrep(token, "'", '"');
			token = strrep(token, 'True', 'true');
			token = strrep(token, 'False', 'false');
			token = strrep(token, 'nan', 'NaN');
			token = strrep(token, ': u"', ': "');
			token = char(token);
			trial = jsondecode(token);

			if isempty(a.trialLog)
				a.trialLog = trial;
			else
				fieldsDiff = setdiff(fieldnames(trial), ...
					fieldnames(a.trialLog));
				for i = 1:length(fieldsDiff)
					a.trialLog(1).(fieldsDiff{i}) = [];
				end
				fieldsDiff = setdiff(fieldnames(a.trialLog), ...
					fieldnames(trial));
				for i = 1:length(fieldsDiff)
					trial.(fieldsDiff{i}) = [];
				end
				a.trialLog(end+1) = trial;
			end

			lineNumber = lineNumber + 1;
		end
		
		fclose(fid);
	end
	
	if isempty(a.trialLog)
		error('[readTrialLog] Could not find a non-empty trial log');
	end
	
	% rename parameters for backwards compatibility
	if any(strcmp(a.version, {'neurobehavior@njit', 'neurobehavior@nyu'}))
		map = {
			% new name         old name
			'targetFile'       'target_filename'
			'targetFile'       'go_filename'      % only nyu
% 			'targetFile2'      'nogo_filename'    % only nyu
			'targetFreq'       'center_frequency' % only nyu
			'targetLevel'      'target_level'
			'trialType'        'ttype'
			'pokeStart'        'poke_start'
			'pokeStop'         'poke_end'
			'targetStart'      'target_start'
			'targetStart'      'start'            % only nyu
			'targetStop'       'target_end'
			'pokeDuration'     'reaction_time'
			'responseDuration' 'response_time'
			'targetDuration'   'target_duration'
			'maskerFile'       'masker_filename'
			'maskerLevel'      'masker_level'
			'maskerFrequency'  'masker_frequency'
			'minPokeDuration'  'poke_duration'
			'holdDuration'     'hold_duration'
			'pokeHoldDuration' 'poke_hold_duration'
			'rewardVolume'     'reward_volume'
			'score'            'response'         % only nyu, TODO: fix
			};
		for i = 1:size(map,1)
			if isfield(a.trialLog, map{i,2})
				% copy old parameter names to new parameter names
				[a.trialLog.(map{i,1})] = a.trialLog.(map{i,2});
				% delete old parameter names
				a.trialLog = rmfield(a.trialLog, map{i,2});
			end
		end
	end
	
	% convert dB attenuations to dB SPL for backwards compatibility
	if strcmpi(a.version, 'neurobehavior@njit')
		for i = 1:length(a.trialLog)
			a.trialLog(i).maskerLevel = round( ...
				44.2 + 50 - a.trialLog(i).maskerLevel);
			a.trialLog(i).targetLevel = round( ...
				21.2 + 75 - a.trialLog(i).targetLevel);
		end
	end
	
	if strcmpi(a.version, 'neurobehavior@nyu')
		targetDuration = num2cell(repelem(1, length(a.trialLog)));
		[a.trialLog.targetDuration] = targetDuration{:};
	end
	
	% convert target tone files to target frequencies in kHz
	if any(strcmpi(a.version, {'ears', 'neurobehavior@njit'}))
		for i = 1:length(a.trialLog)
			res = regexp(a.trialLog(i).targetFile, ...
				'T([0-9_])+\.wav', 'tokens');
			if isempty(res)
				a.trialLog(i).targetFreq = 0;
			else
				a.trialLog(i).targetFreq ...
					= str2double(strrep(res{1}{1}, '_', '.'));
			end
		end
	end
	
	% store some other info in the data struct
	a.trialCount     = length(a.trialLog);
	a.maskerFile     = a.trialLog(1).maskerFile;     % assume constant
	a.maskerLevel    = a.trialLog(1).maskerLevel;    % assume constant
	a.targetFreqs    = [];
	a.targetLevels   = [];
	a.targetDuration = [];
	
	% read all go stimulus conditions
	for trialID = 1:a.trialCount
		if ~strcmpi(a.trialLog(trialID).trialType(1:2), 'GO')
			continue;
		end
		a.targetFreqs  = [a.targetFreqs , a.trialLog(trialID).targetFreq ];
		a.targetLevels = [a.targetLevels, a.trialLog(trialID).targetLevel];
		a.targetDuration = ...
			[a.targetDuration, a.trialLog(trialID).targetDuration];
	end
	a.targetFreqs  = unique(a.targetFreqs);
	a.targetLevels = unique(a.targetLevels);
	a.targetDuration = unique(a.targetDuration);
	% the `unique` function has a weird behavior that returns a 0x1 vector
	% when acting on empty vectors, next 2 lines fix this
	if isempty(a.targetFreqs ); a.targetFreqs  = []; end
	if isempty(a.targetLevels); a.targetLevels = []; end
	if isempty(a.targetDuration); a.targetDuration = []; end
	a.condCount = length(a.targetFreqs) * ...
		length(a.targetLevels)+1;    % +1 for nogo
	% trial count per each stimulus condition (target, masker, go/nogo)
	a.trialCountPerCond = zeros(1, a.condCount);
	for trialID = 1:a.trialCount
		condID = getCondID(a.trialLog(trialID), a);
		a.trialCountPerCond(condID) = a.trialCountPerCond(condID) + 1;
	end
	
	if strcmpi(a.version, 'ears')
		sessionInfo = h5read(file, '/log/session');
		a.experimentMode = deblank(sessionInfo.experimentMode');
		a.experimentStartStr = deblank(sessionInfo.experimentStart');
		a.experimentStart = datetime(a.experimentStartStr, ...
			'inputformat', 'yyyy/MM/dd-HH:mm:ss');
		a.experimentDuration = sessionInfo.experimentDuration;
	end
	
	[a.paradigmGroup, a.paradigmName] = getParadigm(a);
	
end % readTrialLog

function S = structofarrays2arrayofstructs(A)
   % structofarrays2arrayofstructs does exactly what it says.
   % USAGE: 
   %   S = structofarrays2arrayofstructs(A) assumes that A is a struct, 
   %   with each field containing Nx1 (columns) of values. (theoretically
   %   NxM values, where M may vary).  This results in an Nx1 array of
   %   structs, each containing 1 (or M) values.
   %  
   %  Example 1
   %     >> A.flower={'Daisy';'Rose';'Violet'};
   %     >> A.color={'white';'red';'violet'};
   %
   %     >> S = structofarrays2arrayofstructs(A)
   %
   %     S = 
   %     1x3 struct array with fields:
   %         flower
   %         color 
   %       
   %     >> S(2)
   %     ans = 
   %         flower: 'Rose'
   %          color: 'red'
   %
   %  Note, Any cells it encounters are unwrapped.
   
   % -Celso Reyes
   
	fn = fieldnames(A);

	for f = 1:numel(fn)
		if ischar(A.(fn{f}))
			A.(fn{f}) = cellstr(A.(fn{f})');
		end
	end	

	nItems = numel(A.(fn{1}));
	sf = fn';

	sf(2,1:numel(fn)) = {{}};
	sf = sf(:)';
	S = struct(sf{:});

	for f = 1:numel(fn)
		if iscell(A.(fn{f})(1))
			for n = nItems: -1 : 1
				S(n).(fn{f}) = A.(fn{f}){n,:};
			end
		elseif ischar(A.(fn{f})(1))
		else
			for n = nItems: -1 : 1
				S(n).(fn{f}) = A.(fn{f})(n,:);
			end
		end
	end

end
