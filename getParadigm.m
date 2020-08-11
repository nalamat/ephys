% determine paradigm of the specified data/analysis struct
% this script does not work properly on NYU data yet
function [paradigmGroup, paradigmName] = getParadigm(a)

	if ~isfield(a, 'experimentMode')
		paradigmGroup = 'None';
		paradigmName = 'None';
		
	% MMR
	elseif strcmpi(a.experimentMode, 'go nogo') && ...
			any(strcmpi(a.maskerFile, {'supermasker.wav', ...
			'masker-mod-noise-1k.wav'})) && ...
			isequal(a.targetFreqs, 1)
		paradigmGroup = 'MMR';
		paradigmName = 'Mod Noise Active';
	elseif strcmpi(a.experimentMode, 'passive') && ...
			strcmpi(a.maskerFile, 'supermasker.wav') && ...
			isequal(a.targetFreqs, 1)
		paradigmGroup = 'MMR';
		paradigmName = 'Mod Noise Passive';
	elseif strcmpi(a.experimentMode, 'passive') && ...
			(strcmpi(a.maskerFile, '') || a.maskerLevel == 0) && ...
			isequal(a.targetFreqs, 1)
		paradigmGroup = 'MMR';
		paradigmName = 'Silence Passive';
		
	% IM
	elseif strcmpi(a.experimentMode, 'passive') && ...
			strcmpi(a.maskerFile, 'masker-mod-notch-tonal-2k.wav') && ...
			isequal(a.targetFreqs, 0)
		paradigmGroup = 'IM';
		paradigmName = 'Mod Tonal Passive';
	elseif strcmpi(a.experimentMode, 'passive') && ...
			strcmpi(a.maskerFile, 'masker-mod-notch-noise-2k.wav') && ...
			isequal(a.targetFreqs, 0)
		paradigmGroup = 'IM';
		paradigmName = 'Mod Noise Passive';
	elseif strcmpi(a.experimentMode, 'passive') && ...
			strcmpi(a.maskerFile, 'masker-flat-notch-noise-2k.wav') && ...
			isequal(a.targetFreqs, 0)
		paradigmGroup = 'IM';
		paradigmName = 'Flat Noise Passive';
	elseif strcmpi(a.experimentMode, 'passive') && ...
			(strcmpi(a.maskerFile, '') || a.maskerLevel == 0) && ...
			isequal(a.targetFreqs, 0)
		paradigmGroup = 'IM';
		paradigmName = 'Silence Passive';
		
	% AUD
	elseif strcmpi(a.experimentMode, 'passive') && ...
			(strcmpi(a.maskerFile, '') || a.maskerLevel == 0) && ...
			isequal(a.targetFreqs, [.5 1 2 4 8])
		paradigmGroup = 'AUD';
		paradigmName = 'LF Tone Audiometry Passive';
	elseif strcmpi(a.experimentMode, 'passive') && ...
			(strcmpi(a.maskerFile, '') || a.maskerLevel == 0) && ...
			isequal(a.targetFreqs, [8 9 10 11 12 13])
		paradigmGroup = 'AUD';
		paradigmName = 'HF Tone Audiometry Passive';
		
	% IM Old
	elseif strcmpi(a.experimentMode, 'passive') && ...
			strcmpi(a.maskerFile, 'tonal_mask_2000_04.wav') && ...
			isequal(a.targetFreqs, 2)
		paradigmGroup = 'IM Old';
		paradigmName = 'Tonal';
	elseif strcmpi(a.experimentMode, 'passive') && ...
			strcmpi(a.maskerFile, 'notched_noise_mask_2000_04.wav') && ...
			isequal(a.targetFreqs, 2)
		paradigmGroup = 'IM Old';
		paradigmName = 'Noise';
	elseif strcmpi(a.experimentMode, 'passive') && ...
			(strcmpi(a.maskerFile, '') || a.maskerLevel == 0) && ...
			isequal(a.targetFreqs, 2)
		paradigmGroup = 'IM Old';
		paradigmName = 'Silence Passive';
		
	% none
	else
		paradigmGroup = 'None';
		paradigmName = 'None';
	end
	
end

