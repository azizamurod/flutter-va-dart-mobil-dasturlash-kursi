import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/recipe_model.dart';

import '/models/meal_model.dart';

import '/widgets/loading.dart';
import '/widgets/empty_text.dart';
import '/widgets/error_text.dart';
import '/widgets/search/search_result_card.dart';
import '/widgets/search/last_viewed_section.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RecipeModel>(
      builder: (context, recipeModel, child) {
        return recipeModel.searchController.text.isEmpty
            ? const LastViewedSection()
            : (!recipeModel.mealsForSearch.hasLoaded
                ? const Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Loading(),
                  )
                : (recipeModel.mealsForSearch.hasErrored
                    ? const Padding(
                        padding: EdgeInsets.only(top: 50),
                        child: ErrorText(),
                      )
                    : (recipeModel.mealsForSearch.data.isEmpty
                        ? const Padding(
                            padding: EdgeInsets.only(top: 50),
                            child: EmptyText(),
                          )
                        : Column(
                            children: [
                              ...recipeModel.mealsForSearch.data
                                  .map((MealModel el) {
                                return SearchResultCard(
                                  image: el.strMealThumb ?? '',
                                  name: el.strMeal ?? '',
                                  country: el.strArea ?? '',
                                  onTap: () => Navigator.pushNamed(
                                    context,
                                    '/recipe-detail',
                                    arguments: el.idMeal,
                                  ),
                                );
                              })
                            ],
                          ))));
      },
    );
  }
}


// {"meals":"no data found"}