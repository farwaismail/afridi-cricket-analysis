bysort batsmanname: egen truns = total(runs)
bysort batsmanname: egen tdeliveries = total(deliveries)
bysort batsmanname: gen strikerate = (truns/tdeliveries)*100
en careeraverage, gen(cavg)
reg cavg strikerate
ttest strikerate = 0


bysort batsmanname: egen tsixes = total(sixes)
bysort batsmanname: egen tsingles = total(singles)
bysort batsmanname: egen tdoubles = total(doubles)
bysort batsmanname: egen ttriples = total(triples)
bysort batsmanname: egen tfours = total(fours)
reg cavg tsixes tfours ttriples tdoubles tsingles



encode team, gen(nteam)
tab nteam, nolabel
tab nteam
gen top3 = 1 if nteam == 4 | nteam == 20 | nteam == 11
replace top3 = 0 if nteam != 4 & nteam != 20 & nteam != 11
gen mid3 = 1 if nteam == 21 | nteam == 16 | nteam == 8
replace mid3 = 0 if nteam != 21 & nteam != 16 & nteam != 8
gen bot3 = 1 if nteam == 24 | nteam == 5 | nteam == 25
replace bot3 = 0 if nteam != 24 & nteam != 5 & nteam != 25
drop if nteam != 4 & nteam != 5 & nteam != 8 & nteam != 11 & nteam != 16 & nteam != 17 & nteam != 20 & nteam != 21 & nteam != 24 & nteam != 25


encode oppositionteam, gen(oteam)
tab oteam, nolabel
tab oteam
gen top3 = 1 if oteam == 4 | oteam == 20 | oteam == 11
replace top3 = 0 if oteam != 4 & oteam != 20 & oteam != 11
gen mid3 = 1 if oteam == 21 | oteam == 16 | oteam == 8
replace mid3 = 0 if oteam != 21 & oteam != 16 & oteam != 8
gen bot3 = 1 if oteam == 24 | oteam == 5 | oteam == 25
replace bot3 = 0 if oteam != 24 & oteam != 5 & oteam != 25
drop if oteam != 4 & oteam != 5 & oteam != 8 & oteam != 11 & oteam != 16 & oteam != 17 & oteam != 20 & oteam != 21 & oteam != 24 & oteam != 25

drop if batsmanname != "Shahid Afridi"
gen strikerate = (runs/deliveries)*100
reg strikerate top3 mid3

reg runs top3 mid3
