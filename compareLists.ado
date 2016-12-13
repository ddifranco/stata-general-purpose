#delimit;

program compareLists;

	syntax, expected(string) actual(string) [justWarn] /*[emptyok]*/;

	local error = 0;

	local missing: list expected - actual;
	local unexpected: list actual - expected;

	if `.m.p `missing''

		{; 

		di as error "Expected to find - but did not - the following list elements during list comparision:";
		macro list _missing;
		local error = 1; 

		};

	if `.m.p `unexpected''

		{; 

		di as error "Found the following unexpected list elements during list comparision:";
		macro list _unexpected;
		local error = 1;

		};

	if `error' & ~`.m.p `justWarn'' {; exit 198; };

end;

exit;
