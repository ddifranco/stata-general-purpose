#delimit;

program mandups;

	syntax, intermsof(string) [flag(string)] [sgsize(string)] [setid(string)];

	tempvar increment flagv sgsizev;

	duplicates tag `intermsof', gen(`sgsizev');
	gen `flagv' = `sgsizev' > 0;

	sort `intermsof';

	by `intermsof': gen `increment' = (_n == 1);

	if `.m.p `flag''   {; gen `flag'   = `flagv'; };
	if `.m.p `sgsize'' {; gen `sgsize' = `sgsizev' + 1; };
	if `.m.p `setid''  {; gen `setid'  = sum(`increment'); };

end;

exit;
