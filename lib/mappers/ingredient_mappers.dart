import 'package:hello_earth/extensions/list_extensions.dart';
import 'package:hello_earth/networking/models/ingredient.dart';
import 'package:hello_earth/networking/requests/ingredient_request.dart';
import 'package:hello_earth/ui/models/ingredient_model.dart';

extension IngredientMapper on Ingredient {
  IngredientModel mapToIngredientModel() {
    return IngredientModel(
      isBought: isBought,
      name: name,
      quantity: quantity,
    );
  }
}

extension IngredientListMapper on List<Ingredient?>? {
  List<IngredientModel> mapToIngredientsModel() {
    return this
            ?.map(
              (ingredient) => ingredient?.mapToIngredientModel(),
            )
            .toList()
            .filterNotNull() ??
        [];
  }
}

extension IngredientRequestMapper on IngredientModel {
  IngredientRequest mapToIngredientRequest() {
    return IngredientRequest(
      isBought: isBought,
      name: name,
      quantity: quantity,
    );
  }
}

extension IngredientRequestListMapper on List<IngredientModel?>? {
  List<IngredientRequest> mapToListIngredientRequest() {
    return this
            ?.map(
              (ingredient) => ingredient?.mapToIngredientRequest(),
            )
            .toList()
            .filterNotNull() ??
        [];
  }
}
