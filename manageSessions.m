warning('off', 'MATLAB:load:variableNotFound');

d = showGUI();

%% show main GUI
function d = showGUI()
	d = struct();
	d.fig = figure( ...
		'name', 'Manage Sessions', ...
		'visible', 'off', ...
		'position', [0 0 700 500], ...
		'numbertitle', 'off', ...
		'menubar', 'none', ...
		'toolbar', 'none', ...
		'resizefcn', {@figResize});
	
	d.radioDataGroup = uibuttongroup( ...
		'units', 'pixel', ...
		'bordertype', 'none', ...
		'selectionchangedfcn', {@radioDataCallback});
	d.radioDataSummaries = uicontrol( ...
		d.radioDataGroup, ...
		'style', 'radiobutton', ...
		'string', 'Summaries', ...
		'value', true);
	d.radioDataSessions = uicontrol( ...
		d.radioDataGroup, ...
		'style', 'radiobutton', ...
		'string', 'Sessions', ...
		'value', false);

	d.animalList = uicontrol( ...
		'style', 'listbox', ...
		'fontname', 'courier', ...
		'max', 2, ... % multi select
		'callback', {@animalSelected});
	d.header = uicontrol( ...
		'style', 'edit', ...
		'fontname', 'courier', ...
		'horizontalalignment', 'left', ...
		'enable', 'inactive');
	d.sessionList = uicontrol( ...
		'style', 'listbox', ...
		'fontname', 'courier', ...
		'max', 2, ... % multi select
		'callback', {@sessionSelected});

	d.radioSpikeGroup = uibuttongroup( ...
		'units', 'pixel', ...
		'bordertype', 'none', ...
		'selectionchangedfcn', {@radioSpikeCallback});
	d.radioSpikeUnsorted = uicontrol( ...
		d.radioSpikeGroup, ...
		'style', 'radiobutton', ...
		'string', 'Unsorted', ...
		'value', true);
	d.radioSpikeSorted = uicontrol( ...
		d.radioSpikeGroup, ...
		'style', 'radiobutton', ...
		'string', 'Sorted', ...
		'value', false);
	d.radioSpikeSortedJoint = uicontrol( ...
		d.radioSpikeGroup, ...
		'style', 'radiobutton', ...
		'string', 'SortedJoint', ...
		'value', false);

	btns = {
		'Refresh', ['Refresh the list of analysis files and sessions. ' ...
			'Use after modifying the files on disk or sessionTable.xlsx']
		'Extract', ['Extract spikes from the selected session(s), ' ...
			'sort with UMS2K if the option is selected']
		'Inspect', 'Inspect sorted spikes with UMS2K'
		'Analyze', 'Analyze extracted spikes and generate activity metrics'
		'Aggregate', ['Append all analyses into one "mat" file, use ' ...
			'for making portable "mat" files']
		...'Combine', ... % combine
		'Summarize', 'Categorize & summarize units from selected sessions'
		'View', 'View plots of the analysis'};
	d.btns = {};
	for i = 1:length(btns)
		d.btns{i} = uicontrol( ...
			'style', 'pushbutton', ...
			'string', btns{i,1}, ...
			'tooltipstring', btns{i,2}, ...
			'callback', {@btnCallback}, ...
			'buttonDownFcn', {@btnButtonDownFcn});
	end

	d = updateGUIState(d);
	guidata(d.fig, d);
	movegui(d.fig, 'center');
	d.fig.Visible = 'on';
	
	d = refreshLists(d);
	guidata(d.fig, d);
end


%% main GUI callbacks
function figResize(fig, ~)
	d = guidata(fig);
	
	w = fig.Position(3); % window width
	h = fig.Position(4); % window height
	pad1 = 20; % padding to window edges
	pad2 = 10; % padding between components
	lw = 110; % animal list width
	hh = 20; % header height
	rw = 100; % radio group width
	rh = 60; % radio group height
	bw = rw; % button width
	bh = 40; % button height
	
	d.radioDataGroup.Position = max([pad1, h-pad1-rh, rw, rh], 0);
	d.radioDataSummaries.Position = max([pad2 rh/2 rw-pad2*2 rh/2], 0);
	d.radioDataSessions.Position = max([pad2 0 rw-pad2*2 rh/2], 0);
	
% 	d.campusList.Position = max([pad1, h-pad1-lh, lw, lh], 0);
	d.animalList.Position = max([pad1, pad1, lw, h-pad1*2-rh-pad2], 0);
	d.header.Position = ...
		max([pad1+lw+pad2, h-pad1-hh, w-lw-pad2-bw-pad1*3, hh], 0);
	d.sessionList.Position = ...
		max([pad1+lw+pad2, pad1, w-lw-pad2-bw-pad1*3, h-pad1*2-hh], 0);
	
	d.radioSpikeGroup.Position = max([w-rw-pad1 h-pad1-rh rw rh], 0);
	d.radioSpikeUnsorted.Position = max([pad2 rh*2/3 rw-pad2*2 rh/3], 0);
	d.radioSpikeSorted.Position = max([pad2 rh*1/3 rw-pad2*2 rh/3], 0);
	d.radioSpikeSortedJoint.Position = max([pad2 0 rw-pad2*2 rh/3], 0);
	
	for i = 1:length(d.btns)
		d.btns{i}.Position = ...
			max([w-bw-pad1 h-pad1*2-rh-bh-(bh+pad2)*(i-1) bw bh], 0);
	end
	
	guidata(fig, d);
end


function radioDataCallback(radio, ~)
	d = guidata(radio);
	d = updateGUIState(d);
	d = updateSessionList(d);
	guidata(radio, d);
end


function radioSpikeCallback(radio, ~)
	d = guidata(radio);
	d = updateGUIState(d);
	d = updateSessionList(d);
	guidata(radio, d);
end


function animalSelected(lst, ~)
	d = guidata(lst);
	d = updateSessionList(d);
	guidata(lst, d);
end


function sessionSelected(lst, ~)
	d = guidata(lst);
% 	d.dataTableSelected = event.Indices(:,1);
	guidata(lst, d);
end


function btnCallback(btn, ~)
	d = guidata(btn);
	
	d.fig.Pointer = 'watch';
	drawnow;
	
	if strcmpi(d.radioDataGroup.SelectedObject.String, 'sessions')
		sessionIDs = d.sessionList.UserData(d.sessionList.Value);
		if any(sessionIDs == 0) % select all
			sessionIDs = d.sessionList.UserData(2:end);
		end
	end
	
	try
		
	switch lower(btn.String)
		case 'refresh'
			d = refreshLists(d);
			
		case 'extract'
			if strcmpi(d.radioDataGroup.SelectedObject.String, 'summaries')
				error('my:break', 'Extract not defined for summaries');
			end
			
			overwrite = '';
			for i = 1:length(sessionIDs)
				sessionID = sessionIDs(i);
				s = d.sessions{sessionID}; % unpack
				fprintf('Session %d/%d\n', i, length(sessionIDs));
				
				% what to do when extracted spikes already exist
				if s.(['extracted' d.spikeConfig])
					if isempty(overwrite)
						overwrite = questdlg( ...
							'Overwrite already extracted spikes?', ...
							'Overwrite', 'Yes to all', 'Skip all', ...
							'Cancel', 'Cancel');
					end
					if strcmpi(overwrite, 'skip all')
						disp('Skipping');
						continue;
					elseif strcmpi(overwrite, 'cancel')
						error('my:break', 'Canceling');
					end
				end
				
				% extract spikes from the session data files
				mat = struct();
				mat.dataFiles = s.dataFiles;
				mat.analysis = cell(size(s.dataFiles));
				mat.spikes = [];
				
				for fileID = 1:length(s.dataFiles)
					a            = struct();    % analysis data struct
					a.animalName = s.animalName;
					a.dataPath   = s.dataPath;
					a.dataFile   = [s.animalName '/' s.dataFiles{fileID}];
					if isempty(s.channels); a.channels = 'all';
					else; a.channels = s.channels; end
					mat.analysis{fileID} = a; % pack
				end
				
				if strcmpi(d.spikeConfig, 'unsorted')
					[mat.spikes, mat.analysis] = ...
						extractSpikes(mat.analysis);
				elseif any(strcmpi(d.spikeConfig, ...
						{'sorted', 'sortedjoint'}))
					[mat.spikes, mat.analysis] = ...
						extractSpikesUMS(mat.analysis, d.spikeConfig);
				else
					error('[manageSessions] invalid spike config');
				end
				mat.spikeConfig = d.spikeConfig;
				mat.extracted = true;
				mat.inspected = false;
				mat.analyzed = false;
				
				% save extracted spikes to its appropriate file
				file = s.(['file' d.spikeConfig]);
				fprintf('Saving to %s\n', file);
				save(file, '-struct', 'mat', '-v7.3');
				
				% update sessions list
				s.(['extracted' d.spikeConfig]) = mat.extracted;
				s.(['inspected' d.spikeConfig]) = mat.inspected;
				s.(['analyzed' d.spikeConfig]) = mat.analyzed;
				d.sessions{sessionID} = s; % pack
				
				d = updateSessionList(d);
			end
			
			fprintf('Done extracting\n');
			if exist('notify'); notify('Done extracting'); end
			
		case 'inspect'
			if strcmpi(d.radioDataGroup.SelectedObject.String, 'summaries')
				error('my:break', 'Inspect not defined for summaries');
			end
			
			if strcmpi(d.spikeConfig, 'unsorted')
				error('my:break', 'Inspection only for sorted sessions');
			end
			
			if length(sessionIDs)~=1
				error('my:break', 'Select only one session');
			end
			
			sessionID = sessionIDs(1);
			s = d.sessions{sessionID};
			file = s.(['file' d.spikeConfig]);
			fprintf('Loading %s\n', file);
			if ~exist(file, 'file')
				error('my:break', 'Session file doesn''t exist');
			end
			mat = load(file);
			if ~s.(['extracted' d.spikeConfig]) || ~isfield(mat, 'spikes')
				error('my:break', 'Spikes not extracted');
			end
			
			showInspectGUI(d, sessionID, mat);
			
		case 'analyze'
			if strcmpi(d.radioDataGroup.SelectedObject.String, 'summaries')
				error('my:break', 'Analyze not defined for summaries');
			end
			
			overwrite = '';
			for i = 1:length(sessionIDs)
				sessionID = sessionIDs(i);
				s = d.sessions{sessionID}; % unpack
				fprintf('Session %d/%d\n', i, length(sessionIDs));
				
				file = s.(['file' d.spikeConfig]);
				fprintf('Loading %s\n', file);
				if ~exist(file, 'file')
					disp('Session file doesn''t exist, skipping');
					continue;
				end
				mat = load(file);
				if ~s.(['extracted' d.spikeConfig]) || ~isfield(mat, 'spikes')
					disp('Spikes not extracted, skipping');
					continue;
				end
				if ~strcmpi(mat.spikeConfig, d.spikeConfig)
					disp('Inconsistent spike config, skipping');
					continue;
				end
				if isfield(mat, 'analyzed') && mat.analyzed
					if isempty(overwrite)
						overwrite = questdlg( ...
							'Overwrite already analyzed session?', ...
							'Overwrite', 'Yes to all', 'Skip all', ...
							'Cancel', 'Cancel');
					end
					if strcmpi(overwrite, 'skip all')
						disp('Skipping');
						continue;
					elseif strcmpi(overwrite, 'cancel')
						error('my:break', 'Canceling');
					end
				end
				
				% analyze
				mat.analysis = spikesToUnits(mat.spikes, ...
					mat.analysis, mat.spikeConfig);
				for analysisID = 1:length(mat.analysis)
					a = mat.analysis{analysisID}; % unpack
					a.units = analyzeUnits(a.units);
					mat.analysis{analysisID} = a; % pack
				end
				mat.analyzed = true;
				
				% save extracted spikes to its appropriate file
				fprintf('Saving to %s\n', file);
				save(file, '-struct', 'mat', '-append');
				
				% update sessions list
				s.(['analyzed' d.spikeConfig]) = mat.analyzed;
				d.sessions{sessionID} = s; % pack
				
				d = updateSessionList(d);
			end
			
			fprintf('Done analyzing\n');
			if exist('notify'); notify('Done analyzing'); end
			
		case 'aggregate'
			if strcmpi(d.radioDataGroup.SelectedObject.String, 'summaries')
				error('my:break', 'Aggregate not defined for summaries');
			end
			
			% default aggregate file name
			if length(d.animalList.Value)==1
				aggFileName = d.animalList.String{d.animalList.Value};
			else
				aggFileName = 'Aggregate';
			end
			aggFile = sprintf('AnalysisNJIT/%s.mat', aggFileName);
			
			% get file name to save aggregate analysis from user
			aggFile = inputdlg('Enter aggregate file:', ...
				'File', [1 50], {aggFile});
			if isempty(aggFile); error('my:break', ''); end
			aggFile = aggFile{1};
			if length(aggFile)<4 || ~strcmpi(aggFile(end-3:end), '.mat')
				aggFile = [aggFile '.mat'];
			end
			
			analysis = loadSelectedAnalysis(d);
			
			% save if not empty
			if ~isempty(analysis)
				fprintf('Saving aggregate to %s\n', aggFile);
				save(aggFile, 'analysis', '-v7.3');
				% reload summary file list
				d = loadSummaries(d);
			end
			disp('Done');
			
		case 'summarize'
			% default aggregate file name
			if length(d.animalList.Value)==1
				sumFile = d.animalList.String{d.animalList.Value};
			else
				sumFile = 'All';
			end
			sumFile = sprintf('AnalysisNJIT/Summary-%s-%s.mat', ...
				sumFile, d.spikeConfig);
			
			% get file name to save aggregate analysis from user
			sumFile = inputdlg('Enter summary file path:', ...
				'File', [1 50], {sumFile});
			if isempty(sumFile); error('my:break', ''); end
			sumFile = sumFile{1};
			if length(sumFile)<4 || ~strcmpi(sumFile(end-3:end), '.mat')
				sumFile = [sumFile '.mat'];
			end
			
			analysis = loadSelectedAnalysis(d);
			
			if ~isempty(analysis)
				summarizeAnalysis(analysis, sumFile);
				d = loadSummaries(d);
			end
			disp('Done');
			
		case 'view'
			analysis = loadSelectedAnalysis(d);
			
			if ~isempty(analysis)
				viewAnalysis(analysis);
			end
	end
	
	catch err
		if strcmpi(err.identifier, 'my:break')
			if ~isempty(err.message)
				disp(err.message);
			end
		else
			if exist('notify'); notify('Error in "manageSessions.m"'); end
			rethrow(err);
		end
		enableDisableFig(d.fig, 'on');
		figure(d.fig);
	end
	
	d.fig.Pointer = 'arrow';
	guidata(btn, d);
end


function btnButtonDownFcn(btn, e)
	d = guidata(btn);
	
	% make sure the button is enabled and the event is right mouse click
	if ~strcmpi(btn.Enable, 'on') || ~strcmpi(d.fig.SelectionType, 'alt')
		return;
	end
	
	flag = lower(btn.String);
	switch flag
		case {'extract', 'inspect', 'analyze'}
			if ~strcmpi(d.radioDataGroup.SelectedObject.String, 'sessions')
				return;
			end
			
			ans = questdlg(['Remove ' flag ' flag?'], 'Remove', ...
				'Yes', 'No', 'No');
			
			if strcmpi(ans, 'yes')
				sessionIDs = d.sessionList.UserData(d.sessionList.Value);
				if any(sessionIDs == 0) % select all
					sessionIDs = d.sessionList.UserData(2:end);
				end
				
				d.fig.Pointer = 'watch';
				drawnow;
				for i = 1:length(sessionIDs)
					sessionID = sessionIDs(i);
					fprintf('Session %d/%d\n', i, length(sessionIDs));
					s = d.sessions{sessionID}; % unpack
					file = s.(['file' d.spikeConfig]);
					mat = struct();
					
					if strcmpi(flag, 'extract')
						mat.extracted = false;
						s.(['extracted' d.spikeConfig]) = false;
					end
					if any(strcmpi(flag, {'extract','inspect'}))
						mat.inspected = false;
						s.(['inspected' d.spikeConfig]) = false;
					end
					if any(strcmpi(flag, {'extract','inspect','analyze'}))
						mat.analyzed = false;
						s.(['analyzed' d.spikeConfig]) = false;
					end
					
					if exist(file, 'file')
						save(file, '-struct', 'mat', '-append');
					end
					
					d.sessions{sessionID} = s;
					d = updateSessionList(d);
				end
				
				d.fig.Pointer = 'arrow';
				disp('Done');
			end
	end
	
	guidata(btn, d);
end

%% inspect GUI functions and callbacks
function showInspectGUI(d, sessionID, mat)
	enableDisableFig(d.fig, 'off');
	
	d2 = struct();
	d2.fig = d.fig;
	d2.sessionID = sessionID;
	d2.spikes = mat.spikes;
	d2.channels = mat.analysis{1}.channels;
	d2.spikeConfig = mat.spikeConfig;
	d2.changed = false;
	if isfield(mat, 'inspected') && ...
			length(mat.inspected)==length(mat.spikes)
		d2.inspected = mat.inspected;
	else
		d2.inspected = false(size(mat.spikes));
	end
	
	d2.fig2 = figure( ...
		'name', 'Inspect', ...
		'visible', 'off', ...
		'position', [0 0 200 400], ...
		'numbertitle', 'off', ...
		'menubar', 'none', ...
		'toolbar', 'none', ...
		'resizefcn', {@inspectResize}, ...
		'closerequestfcn', {@inspectCloseRequest});
	
	d2.channelList = uicontrol( ...
		'style', 'listbox', ...
		'fontname', 'courier', ...
		'max', 1); ... % single select
	
	btns2 = {'Inspect'};
	d2.btns = {};
	for i = 1:length(btns2)
		d2.btns2{i} = uicontrol( ...
			'style', 'pushbutton', ...
			'string', btns2{i}, ...
			'callback', {@btn2Callback}, ...
			'buttonDownFcn', {@btn2ButtonDownFcn});
	end
	
	guidata(d2.fig2, d2);
	d2.fig2.Position(1:2) = d.fig.Position(1:2) + ...
		(d.fig.Position(3:4) - d2.fig2.Position(3:4))/2;
% 	movegui(d2.fig2, 'center');
	d2.fig2.Visible = 'on';
	
	d2 = updateChannelList(d2);
	guidata(d2.fig2, d2);
end


function inspectResize(fig2, ~)
	d2 = guidata(fig2);
	
	w = fig2.Position(3);
	h = fig2.Position(4);
	pad1 = 20;
	pad2 = 10;
	bw = (w-pad1*2+pad2)/ length(d2.btns2);
	bh = 40;
	
	d2.channelList.Position = ...
		max([pad1 pad1 w-pad1*2 h-pad1*2-pad2-bh], 0);
	
	for i = 1:length(d2.btns2)
		d2.btns2{i}.Position = ...
			max([pad1+bw*(i-1) h-pad1-bh bw-pad2 bh], 0);
	end
	
	guidata(fig2, d2);
end


function inspectCloseRequest(fig2, ~)
	d2 = guidata(fig2);
	figure(d2.fig);
	delete(d2.fig2);
	enableDisableFig(d2.fig, 'on');
end


function btn2Callback(btn2, ~)
	d2 = guidata(btn2);
	
	switch lower(btn2.String)
		case 'inspect'
			if strcmpi(d2.spikeConfig, 'sortedjoint')
				spikes = d2.spikes;
			else
				d2.channelID = d2.channelList.Value;
				spikes = d2.spikes{d2.channelID};
			end
			
			assignin('base', 'inspectedSpikes', []);
% 			disp('Openning UMS split merge tool');
			fig3 = figure('Units','Normalized', 'Position', ...
				spikes.params.display.default_figure_size);

			d3 = struct();
			d3.fig = d2.fig;
			d3.fig2 = d2.fig2;
			d3.fig3 = fig3;
			guidata(fig3, d3);

			enableDisableFig(d2.fig2, 'off');
			splitmerge_tool(spikes, 'all', fig3, 'inspectedSpikes');
			fig3.CloseRequestFcn = @mergeToolCloseRequest;
	end
	
	guidata(btn2, d2);
end


function mergeToolCloseRequest(fig3, ~)
	inspectedSpikes = evalin('base', 'inspectedSpikes');
	
	d3 = guidata(fig3);
	d2 = guidata(d3.fig2);
	d = guidata(d3.fig);
	
	if isempty(inspectedSpikes)
		res = questdlg('Close without saving?', ...
			'Close', 'Yes', 'No', 'No');
		
		% after question dialog, all figure get enabled!!
		enableDisableFig(d.fig, 'off');
		enableDisableFig(d2.fig2, 'off');
		
		if strcmpi(res, 'Yes')
			figure(d2.fig2);
			delete(d3.fig3);
			enableDisableFig(d2.fig2, 'on');
		end
	else
		res = questdlg('Save inspected spikes?', ...
			'Save', 'Yes', 'No', 'Yes');
		
		% after question dialog, all figure get enabled!!
		enableDisableFig(d.fig, 'off');
		enableDisableFig(d2.fig2, 'off');
		
		figure(d2.fig2);
		delete(d3.fig3);
		
		if strcmpi(res, 'Yes')
			d2.changed = true;
			if strcmpi(d2.spikeConfig, 'sortedjoint')
				d2.spikes = inspectedSpikes;
				d2.inspected = true;
			else
				d2.spikes{d2.channelID} = inspectedSpikes;
				d2.inspected(d2.channelID) = true;
			end
			d2 = updateChannelList(d2);
			
			try
				mat = struct();
				mat.spikes = d2.spikes;
				mat.inspected = d2.inspected;
				mat.analyzed = false;

				d2.fig2.Pointer = 'watch';
				drawnow;
				
				s = d.sessions{d2.sessionID};
				file = s.(['file' d.spikeConfig]);
				fprintf('Saving to %s\n', file);
				save(file, '-struct', 'mat', '-append');
				fprintf('Done\n');

				s.(['inspected' d.spikeConfig]) = mat.inspected;
				s.(['analyzed' d.spikeConfig]) = mat.analyzed;
				d.sessions{d2.sessionID} = s; % pack

				d = updateSessionList(d);
				
				d2.fig2.Pointer = 'arrow';

			catch err
				enableDisableFig(d2.fig2, 'on');
				rethrow(err);
			end
		else
			disp('Changes not saved');
		end
		
		enableDisableFig(d2.fig2, 'on');
	end
	
	guidata(d.fig, d);
	guidata(d2.fig2, d2);
end


function d2 = updateChannelList(d2)
	d2.fig2.Pointer = 'watch';
	
	% save selected item and scroll position
	channelListValue = d2.channelList.Value;
	channelListTop = d2.channelList.ListboxTop;
	
	rows = {};
	bool = {'-', 'x'};
	if strcmpi(d2.spikeConfig, 'sortedjoint')
		rows = {sprintf('All channels  | %s', bool{d2.inspected+1})};
	else
		for i = 1:length(d2.channels)
			row = sprintf('Channel %2d    | %s', ...
				d2.channels(i), bool{d2.inspected(i)+1});
			rows{end+1} = row;
		end
	end
	
	% restore selected item and scroll postion
	d2.channelList.String = rows;
	d2.channelList.Value = channelListValue;
	d2.channelList.ListboxTop = channelListTop;
	
	d2.fig2.Pointer = 'arrow';
end


%% helper functions
function d = updateGUIState(d)
	% summaries vs sessions
	if strcmpi(d.radioDataGroup.SelectedObject.String, 'summaries')
		enable = 'off';
	else
		enable = 'on';
	end
	d.animalList.Enable = enable;
	d.radioSpikeUnsorted.Enable = enable;
	d.radioSpikeSorted.Enable = enable;
	d.radioSpikeSortedJoint.Enable = enable;
	btns = {'extract', 'inspect', 'analyze', 'aggregate', 'summarize'};
	for i = 1:length(d.btns)
		if any(strcmpi(d.btns{i}.String, btns))
			d.btns{i}.Enable = enable;
		end
	end
	
	% sorted vs unsorted
	d.spikeConfig = d.radioSpikeGroup.SelectedObject.String;
	if strcmpi(d.spikeConfig, 'unsorted')
		enable = 'off';
	else
		enable = 'on';
	end
	btns = {'inspect'};
	for i = 1:length(d.btns)
		if any(strcmpi(d.btns{i}.String, btns))
			d.btns{i}.Enable = enable;
		end
	end
end


function d = loadSummaries(d)
	d.summaries = {};
	
	dirs = {'AnalysisNJIT/', 'AnalysisNYU/'};
	for i = 1:length(dirs)
		folder = dirs{i};
		files = dir(folder);
		for j = 1:length(files)
			file = files(j).name;
			if length(file)>=3 && strcmpi(file(end-3:end), '.mat')
				d.summaries{end+1} = [folder file];
			end
		end
	end
end


function d = loadSessions(d)
	sessionTable = readtable('sessionTable.xlsx');
	sessionTable = sessionTable(sessionTable.use~=false, :);
	sessionTable = sessionTable(~cellfun(@isempty, ...
		sessionTable.dataFiles), :);
	
	d.sessions = cell(1,size(sessionTable,1));
	
	tic;
	for i = 1:size(sessionTable,1)
		s = table2struct(sessionTable(i,:));
		
		if ~isempty(s.dataPath) && ...
				~any(strcmpi(s.dataPath(end), {'/', '\\'}))
			s.dataPath = [s.dataPath '/'];
		end
		
		s.dataFiles = strsplit(s.dataFiles, '\n');
		
		if ~isempty(s.channels)
			s.channels = eval(s.channels);
		end
% 		if ~isempty(s.excludeTrials)
% 			s.excludeTrials = eval(s.excludeTrials);
% 		end
		
		% get the path of session data files and make sure they're in the
		% same folder
		path = [];
		for j = 1:length(s.dataFiles)
			file = sprintf('%s%s/%s', s.dataPath, ...
				s.animalName, s.dataFiles{j});
			[path2, ~, ~] = fileparts(file);
			if isempty(path)
				path = path2;
			elseif ~strcmpi(path, path2)
				error('Session data files should be in the same folder');
			end
		end
		
		if strcmpi(s.date, '20190605')
			'hello';
		end
		
		spikeConfigs = {'Unsorted', 'Sorted', 'SortedJoint'};
		for j = 1:length(spikeConfigs)
			spikeConfig = spikeConfigs{j};
			file = sprintf('%s/%s-%s-%s-%s.mat', path, ...
				s.animalName, s.date, s.paradigm, spikeConfig);
			dataFiles = {};
			extracted = false;
			inspected = false;
			analyzed = false;
			if exist(file, 'file')
				load(file, 'dataFiles', 'extracted', ...
					'inspected', 'analyzed');
			end
			% if data files listed in session table have changed since
			% the last extraction or analysis
			if ~isempty(setxor(dataFiles, s.dataFiles)) || ...
					isempty(dataFiles)
				extracted = false;
				inspected = false;
				analyzed = false;
			end
			s.(['file' spikeConfig]) = file;
			s.(['extracted' spikeConfig]) = extracted;
			s.(['inspected' spikeConfig]) = inspected;
			s.(['analyzed' spikeConfig]) = analyzed;
		end
		
		d.sessions{i} = s; % pack
	end
	toc
end

	
function d = updateAnimalList(d)
	animalNames = cellfun(@(s){s.animalName}, d.sessions);
	rows = ['All', unique(animalNames, 'stable')];
	
	% save selected item and scroll position
	value = d.animalList.Value;
	listboxTop = d.animalList.ListboxTop;
	
	d.animalList.String = rows;
	
	% restore selected item and scroll postion
	value(value>length(d.animalList.String)) = [];
	d.animalList.Value = value;
	listboxTop = min(length(d.animalList.String), listboxTop);
	d.animalList.ListboxTop = listboxTop;
	
	drawnow;
end


function d = updateSessionList(d)

	if strcmpi(d.radioDataGroup.SelectedObject.String, 'summaries')
		d.header.String = 'Summary or aggregate analysis files';
		
		listUserData = [];
		listString = d.summaries;
		
	else
		cols = {'animalName', 'date', 'paradigm', ...
			['extracted' d.spikeConfig], ['inspected' d.spikeConfig], ...
			['analyzed' d.spikeConfig]};
		colNames = {'Animal Name', 'Date', 'Paradigm', 'E', 'I', 'A'};
		animalNames = d.animalList.String(d.animalList.Value);

		fmt = '%-13s | %-12s | %-10s | %s | %s | %s';

% 		fmt = '%%-%ds | %%-%ds | %%-%ds | %%s | %%s | %%s';
% 		colWidths = {};
% 		for j = 1:length(cols)
% 			if ~islogical(d.dataTable{1,cols{j}})
% 				colWidths{end+1} = max(cellfun(@length, ...
% 					[colNames{j}; d.dataTable{:,cols{j}}]));
% 			end
% 		end
% 		fmt = sprintf(fmt, colWidths{:});

		d.header.String = sprintf(fmt, colNames{:});

		bool = {'-','x'};
		sessionIDs = [0];
		sessionRows = {'All'};
		for i = 1:length(d.sessions)
			row = cell(length(cols),1);
			if ~any(strcmpi('all', animalNames)) && ...
					~any(strcmpi(d.sessions{i}.animalName, animalNames))
				continue;
			end
			for j = 1:length(cols)
				val = d.sessions{i}.(cols{j});
				if islogical(val)
					if any(val) && ~all(val)
						row{j} = '~';
					else
						row{j} = bool{all(val)+1};
					end
				else
					row{j} = val;
				end
			end
			sessionIDs(end+1) = i;
			sessionRows{end+1} = sprintf(fmt, row{:});
		end

		listUserData = sessionIDs;
		listString = sessionRows;
	end
	
	% save selected item and scroll position
	value = d.sessionList.Value;
	listboxTop = d.sessionList.ListboxTop;
	
	d.sessionList.UserData = listUserData;
	d.sessionList.String = listString;
	
	% restore selected item and scroll postion
	value(value>length(d.sessionList.String)) = [];
	d.sessionList.Value = value;
	listboxTop = min(length(d.sessionList.String), listboxTop);
	d.sessionList.ListboxTop = listboxTop;
	
	drawnow;
end


function d = refreshLists(d)
	d.fig.Pointer = 'watch';
	
	% save selected item and scroll position
	animalListValue = d.animalList.Value;
	animalListTop = d.animalList.ListboxTop;
	sessionListValue = d.sessionList.Value;
	sessionListTop = d.sessionList.ListboxTop;
	
	d.header.String = 'Loading';
	d.animalList.String = {};
	d.sessionList.String = {};
	drawnow;
	
% 	d = loadSessionsOld(d);
	d = loadSummaries(d);
	d = loadSessions(d);
	d = updateAnimalList(d);
	d = updateSessionList(d);
	
	% restore selected item and scroll postion
	animalListValue(animalListValue>length(d.animalList.String)) = [];
	d.animalList.Value = animalListValue;
	animalListTop = min(length(d.animalList.String), animalListTop);
	d.animalList.ListboxTop = animalListTop;
	sessionListValue(sessionListValue>length(d.sessionList.String)) = [];
	d.sessionList.Value = sessionListValue;
	sessionListTop = min(length(d.sessionList.String), sessionListTop);
	d.sessionList.ListboxTop = sessionListTop;
	
	d.fig.Pointer = 'arrow';
end


function analysis = loadSelectedAnalysis(d)
	analysis = {};
			
	% summaries and aggregates
	if strcmpi(d.radioDataGroup.SelectedObject.String, 'summaries')
		summaries = d.sessionList.String(d.sessionList.Value);
		
		for i = 1:length(summaries)
			file = summaries{i};
			fprintf('Loading %d/%d: %s\n', ...
				i, length(summaries), file);
			if ~exist(file, 'file')
				disp('Summary file doesn''t exist, skipping');
				continue;
			end
			mat = load(file, 'analysis');
			if ~isfield(mat, 'analysis')
				disp('No analysis found, skipping');
				continue;
			end

			analysis = [analysis mat.analysis];
		end

	% sessions
	else
		sessionIDs = d.sessionList.UserData(d.sessionList.Value);
		if any(sessionIDs == 0) % select all
			sessionIDs = d.sessionList.UserData(2:end);
		end
		
		for i = 1:length(sessionIDs)
			sessionID = sessionIDs(i);
			s = d.sessions{sessionID}; % unpack
			fprintf('Session %d/%d\n', i, length(sessionIDs));

			file = s.(['file' d.spikeConfig]);
			fprintf('Loading %s\n', file);
			if ~exist(file, 'file')
				disp('Session file doesn''t exist, skipping');
				continue;
			end
			mat = load(file, 'analysis', 'analyzed', 'spikeConfig');
			if ~strcmpi(mat.spikeConfig, d.spikeConfig)
				disp('Inconsistent spike config, skipping');
				continue;
			end
			if ~s.(['analyzed' d.spikeConfig]) || ...
					~isfield(mat,'analysis')
				disp('Session not analyzed, skipping');
				continue;
			end

			analysis = [analysis mat.analysis];
		end
	end
end
