u.svmTimes = 100e-3:10e-3:1;
condID=2;

for i = 1:length(u.svmTimes)
	mask = 0<=u.psthCenters & u.psthCenters<=u.svmTimes(i);
	x0 = u.psth{1}(:, mask);
	x1 = u.psth{condID}(:, mask);
	x = [x0; x1];
	y = repelem([0, 1], [size(x0,1), size(x1,1)]);
	mdl = fitcsvm(x, y);
	[label, ~] = predict(mdl, x);
	score = sum(label==y')/length(label);
	u.svmScores{condID}(i) = score;
end