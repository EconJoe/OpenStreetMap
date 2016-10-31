

local states alabama alaska arizona arkansas california colorado connecticut delaware district-of-columbia ///
             florida georgia hawaii idaho illinois indiana iowa kansas kentucky louisiana maine maryland ///
			 massachusetts michigan minnesota mississippi missouri montana nebraska nevada new-hampshire ///
			 new-jersey new-mexico new-york north-carolina north-dakota ohio oklahoma oregon pennsylvania ///
			 rhode-island south-carolina south-dakota tennessee texas utah vermont virginia washington ///
			 west-virgina wicconsin wyoming

set more off
foreach state in `states' {

	display in red "------- State: `state' -----------"

	cd B:\Research\RAWDATA\OSM\Parsed\ID
	import delimited "`state'_ID.txt", clear varnames(1) delimiter(tab)
	compress
	save `state'_ID, replace
	
	cd B:\Research\RAWDATA\OSM\Parsed\Addresses
	import delimited "`state'_addr.txt", clear varnames(1) delimiter(tab)
	compress
	save `state'_addr, replace
	
	cd B:\Research\RAWDATA\OSM\Parsed\LonLat
	import delimited "`state'_lonlat.txt", clear varnames(1) delimiter(tab)
	compress
	save `state'_lonlat, replace

	cd B:\Research\RAWDATA\OSM\Parsed\Names
	import delimited "`state'_names.txt", clear varnames(1) delimiter(tab)
	compress
	save `state'_names, replace
}
