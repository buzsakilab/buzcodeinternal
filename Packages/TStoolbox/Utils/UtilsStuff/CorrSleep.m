function A = AutoCorrMaze(A)

refCell = 44;


A = getResource(A,'Sleep1Epoch');
sleep1Epoch = sleep1Epoch{1};

A = getResource(A,'Sleep2Epoch');
sleep2Epoch = sleep2Epoch{1};

A = getResource(A,'SpikeData');
nbCells = length(S);

A = getResource(A,'CellNames');

resdir = [parent_dir(A), filesep 'XCorr' filesep 'Sleep' filesep 'Cross'];
[p,ds,e] = fileparts(current_dir(A));


t0 = Range(Restrict(S{refCell},sleep1Epoch));

for i=1:nbCells

	t = Range(Restrict(S{i},sleep1Epoch));
	[C,B] = CrossCorr(t0,t,4,2000);
	C(301) = 0;
	
	fh = figure(1),clf
	bar(B,C);
	
	saveas(fh,[resdir filesep ds '_' cellnames{refCell} '_' cellnames{i} 'AutoCorrSleep1_1s_4msBin'],'png')

end

t0 = Range(Restrict(S{refCell},sleep2Epoch));
for i=1:nbCells

	t = Range(Restrict(S{i},sleep2Epoch));
	[C,B] = CrossCorr(t0,t,4,2000);
	C(301) = 0;
	
	fh = figure(1),clf
	bar(B,C);
	
	saveas(fh,[resdir filesep ds '_' cellnames{refCell} '_' cellnames{i} 'AutoCorrSleep2_1s_4msBin'],'png')

end
