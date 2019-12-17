function res = isSameDay(dt1, dt2)
	[y1,m1,d1] = ymd(dt1);
	[y2,m2,d2] = ymd(dt2);
	
	res = all([y1,m1,d1] == [y2,m2,d2]);
end
