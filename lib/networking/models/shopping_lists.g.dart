// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_lists.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShoppingLists _$ShoppingListsFromJson(Map<String, dynamic> json) =>
    ShoppingLists(
      shoppingLists: (json['shoppingLists'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            k,
            e == null
                ? null
                : ShoppingList.fromJson(e as Map<String, dynamic>)),
      ),
    );
