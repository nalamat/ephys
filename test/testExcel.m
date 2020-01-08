file = 'AnalysisNJIT/Summary-test.xlsx';

header = strsplit('RecMode,UnitID,TargetLevel,Score,Time,dPrime', ',');

data = {'Active', 16, 40, 'HIT', 0.00, 2.11221900802693873e-04
	'Active', 35, 50, 'HIT', 0.15, -5.99128854456604242e-03
	'Active', 178, 55, 'HIT', 0.45, -1.44581893994131238e-02
	'Active', 30, 60, 'MISS', 0.60, 6.26613256664981799e-02};
	
t = cell2table(data, 'variablenames', header);
delete(file);
writetable(t, file, 'sheet', 'dPrime');