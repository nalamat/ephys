% for roving target level
animals = {'CMR02Head', 'CMR02Left', ...
	'CMR05Left', 'CMR05Fluffy', 'CMR05Tail', ...
	'CMR06Right', 'CMR06Left', 'CMR06Fluffy', ...
	'D1Right', 'D1Left', 'D1Tail', 'D1Fluffy'};

% for roving target duration
animals = {'CMR05Tail', 'D1Left'};

folders = {'Data', 'Data-Booth1-EARS'};

T = [];
session = 1;

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
			
			% roving target level
% 			if length(a.targetLevels) == 3 && ...
% 					all(a.targetLevels == [40, 50, 60]) && ...
% 					any(a.performance.dPrime >= 2) && ...
% 					a.maskerLevel == 50
% 				for t = a.trialLog
% 					T(end+1).Subject = animal;
% 					T(end).Session = session;
% 					T(end).TargetLevel = t.targetLevel;
% 					T(end).Score = t.score;
% 					T(end).ResponseDuration = t.responseDuration;
% 				end
% 				session = session + 1;
% 			end
					
			% roving target duration
			if length(a.targetDuration) > 1 && ...
					any(a.targetDuration <= .2) && ...
					any(a.performance.dPrime >= 2)

				for t = a.trialLog
					T(end+1).Subject = animal;
					T(end).Session = session;
					T(end).TargetDuration = t.targetDuration;
					T(end).Score = t.score;
					T(end).ResponseDuration = t.responseDuration;
				end
				session = session + 1;
			end
		end
	end
end

writetable(struct2table(T), 'AnalysisNJIT/Behavior-TargetDuration.xlsx');
% writetable(struct2table(T), 'AnalysisNJIT/Behavior-TargetLevel.xlsx');
