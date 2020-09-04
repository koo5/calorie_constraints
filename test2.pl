 :- use_module(library(clpfd)).

solve :-
	Meal_cal #>= 1800000, Meal_cal #=< 2200000,
	Meal_cal #= Ingredients0_cal + Ingredients1_cal + Ingredients2_cal, % total meal calories is sum of the portion of calories coming from ingredient0 and of those coming from ingredient1. 

	Ingredients0_cal #= 347 * Ingredients0_g, % there are 347 calories in 1g of ingredient0
	Ingredients1_cal #= 123 * Ingredients1_g,
	Ingredients2_cal #= 5670 * Ingredients2_g,
	
	Ingredients0_g #>= 0,
	Ingredients1_g #>= 0,
	Ingredients2_g #>= 0,
	Ingredients0_g #=< 400, % let's assume max 400g of any one ingredient
	Ingredients1_g #=< 400,
	Ingredients2_g #=< 400,
	
	labeling([], [Ingredients0_g,Ingredients1_g,Ingredients2_g]),
	
	write('behold:'),nl,
	writeq(('Ingredients0_g:', Ingredients0_g)),nl,
	writeq(('Ingredients1_g:', Ingredients1_g)),nl,
	writeq(('Ingredients2_g:', Ingredients2_g)),nl,
	writeq(('Meal_cal:', Meal_cal)),nl,
	
	false % failure-driven loop
	.
	


/*

koom@dev ~/aindilis/calorie_constraints (master) [4]> swipl -s test2.pl -g solve,halt
behold:
'Ingredients0_g:',0
'Ingredients1_g:',0
'Ingredients2_g:',318
'Meal_cal:',1803060
behold:
'Ingredients0_g:',0
'Ingredients1_g:',0
'Ingredients2_g:',319
'Meal_cal:',1808730
behold:

...


*/



