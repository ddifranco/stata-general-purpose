#delimit;

program getStamp, rclass;

	local dcomp = subinstr("`c(current_date)'", " ", "_", .);
	local tcomp = subinstr("`c(current_time)'", ":", "",  .);
	local rcomp = floor(runiform()*10e3);

	return local stamp "`dcomp'_`tcomp'_`rcomp'";

end;

exit;
