 :- use_module(library(clpfd)).

solve :-
	%Meal_calories_cal #>= 1800000, Meal_calories_cal #=< 2200000,
	Meal_calories_cal #= 2000000,
	
	Meal_calories_cal #= Ingredients_0_calories_cal + Ingredients_1_calories_cal,

	Ingredients_0_calories_cal #= 347 * Ingredients_0_g,
	
	Ingredients_0_g #>= 0,
	Ingredients_0_g #=< 1000000,
	Ingredients_1_g #>= 0,
	Ingredients_1_g #=< 1000000,
	
	Ingredients_1_calories_cal #= 123 * Ingredients_1_g,
%gtrace,
	labeling([], [Meal_calories_cal,Ingredients_0_g,Ingredients_1_g]),
	write('behold:'),nl,
	writeq(('Ingredients_0_g:', Ingredients_0_g)),nl,
	writeq(('Ingredients_1_g:', Ingredients_1_g)),nl,
	writeq(('Meal_calories_cal:', Meal_calories_cal)),nl,
	false	
	.
	
	



