import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/model/meal_model.dart';

// here use 'StateNotifierProvider' instead of 'Provide' b/c here the data will changed

class FavouriteMealNotifier extends StateNotifier<List<MealModel>> {
  FavouriteMealNotifier() : super([]);

  bool toggleMealFavouriteStatus(MealModel meal) {
    final mealIsFavourite = state.contains(meal);

    if (mealIsFavourite) {
      state = state.where((favMeal) => favMeal.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favouriteMealsProvider =
    StateNotifierProvider<FavouriteMealNotifier, List<MealModel>>((ref) {
  return FavouriteMealNotifier();
});
