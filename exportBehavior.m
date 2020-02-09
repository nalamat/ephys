% for roving SNR
% animals = {'CMR02Head', 'CMR02Left', 'CMR05Left', 'CMR05Fluffy', ...
% 	'CMR05Tail', 'CMR06Right', 'CMR06Left'};

% for roving target duration
animals = {'CMR05Tail', 'D1Left'};

folders = {'Data', 'Data-Booth1-EARS'};

T = [];

for folder = string(folders)
	for animal = string(animals)
		path = sprintf('../%s/%s/', folder, animal);
		fprintf('Browsing through %s\n', path);
		files = dir(strcat(path, '*.h5'));
		files = {files.name};
		
		for file = string(files)
			try
				a = readTrialLog(strcat(path, file));
			catch
				continue
			end
			
			if length(a.targetDuration) > 1 && ...
					any(a.targetDuration <= .2) && ...
					any(a.performance.dPrime >= 2)

				for t = a.trialLog
					T(end+1).SubjectID = animal;
					T(end).TargetDuration = t.targetDuration;
					T(end).Score = t.score;
					T(end).ResponseDuration = t.responseDuration;
				end
			end
		end
	end
end

writetable(struct2table(T), 'AnalysisNJIT/TargetDuration.xlsx');