import 'package:hello_earth/networking/requests/ingredient_request.dart';
import 'package:json_annotation/json_annotation.dart';

part 'shopping_list_request.g.dart';

@JsonSerializable(
  createFactory: false,
  explicitToJson: true,
)
class ShoppingListRequest {
  final List<IngredientRequest?>? ingredients;
  final bool? isParentVisible;
  final String? missionName;

  const ShoppingListRequest({
    this.ingredients,
    this.isParentVisible,
    this.missionName,
  });

  Map<String, dynamic> toJson() => _$ShoppingListRequestToJson(this);
}
