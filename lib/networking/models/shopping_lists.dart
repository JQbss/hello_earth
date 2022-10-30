import 'package:hello_earth/commons/from_json_factory.dart';
import 'package:hello_earth/networking/models/shopping_list.dart';
import 'package:json_annotation/json_annotation.dart';

part 'shopping_lists.g.dart';

@JsonSerializable(
  createToJson: false,
  explicitToJson: true,
)
class ShoppingLists {
  static const FromJsonFactory<ShoppingLists> fromJsonFactory = _$ShoppingListsFromJson;
  final Map<String, ShoppingList?>? shoppingLists;

  const ShoppingLists({
    this.shoppingLists,
  });

  factory ShoppingLists.fromJson(Map<String, dynamic> json) => _$ShoppingListsFromJson(json);
}
