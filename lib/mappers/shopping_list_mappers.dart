import 'package:hello_earth/mappers/mappers.dart';
import 'package:hello_earth/networking/models/shopping_list.dart';
import 'package:hello_earth/networking/models/shopping_lists.dart';
import 'package:hello_earth/networking/requests/shopping_list_request.dart';
import 'package:hello_earth/pages/shopping_list/shopping_list_details/shopping_list_details_arguments.dart';
import 'package:hello_earth/ui/models/shopping_list_model.dart';
import 'package:hello_earth/ui/models/shopping_lists_model.dart';

extension ShoppingListMapper on ShoppingList {
  ShoppingListModel mapToShoppingListModel() {
    return ShoppingListModel(
      ingredients: ingredients.mapToIngredientsModel(),
      isParentVisible: isParentVisible,
      missionName: missionName,
    );
  }
}

extension ShoppingListsMapper on ShoppingLists {
  ShoppingListsModel mapToShoppingListsModel() {
    return ShoppingListsModel(
      shoppingLists: shoppingLists?.map(
            (key, shoppingList) => MapEntry(
              key,
              shoppingList?.mapToShoppingListModel() ?? ShoppingListModel(),
            ),
          ) ??
          {},
    );
  }
}

extension ShoppingListRequestMapper on ShoppingListDetailsArguments {
  ShoppingListRequest mapToShoppingListRequest() {
    return ShoppingListRequest(
      ingredients: ingredients?.mapToListIngredientRequest(),
      missionName: missionName,
      isParentVisible: isParentVisible,
    );
  }

  ShoppingListModel mapToShoppingListFromArguments() {
    return ShoppingListModel(
      ingredients: ingredients,
      missionName: missionName,
      isParentVisible: isParentVisible,
    );
  }
}

extension ShoppingListModelMappers on ShoppingListModel {
  ShoppingListRequest mapToShoppingListRequest() {
    return ShoppingListRequest(
      ingredients: ingredients?.mapToListIngredientRequest(),
      isParentVisible: isParentVisible,
      missionName: missionName,
    );
  }
}