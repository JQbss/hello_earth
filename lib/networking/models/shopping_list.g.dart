// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShoppingList _$ShoppingListFromJson(Map<String, dynamic> json) => ShoppingList(
      ingredients: (json['ingredients'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Ingredient.fromJson(e as Map<String, dynamic>))
          .toList(),
      isParentVisible: json['isParentVisible'] as bool?,
      missionName: json['missionName'] as String?,
    );
