import 'package:hello_earth/commons/from_json_factory.dart';
import 'package:hello_earth/networking/models/ingredient.dart';
import 'package:json_annotation/json_annotation.dart';

part 'shopping_list.g.dart';

@JsonSerializable(
  createToJson: false,
  explicitToJson: true,
)
class ShoppingList {
  static const FromJsonFactory<ShoppingList> fromJsonFactory = _$ShoppingListFromJson;
  final List<Ingredient?>? ingredients;
  final bool? isParentVisible;
  final String? missionName;

  const ShoppingList({
    this.ingredients,
    this.isParentVisible,
    this.missionName,
  });

  factory ShoppingList.fromJson(Map<String, dynamic> json) => _$ShoppingListFromJson(json);
}
