import 'package:hello_earth/commons/from_json_factory.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ingredient.g.dart';

@JsonSerializable(
  createToJson: false,
  explicitToJson: true,
)
class Ingredient {
  static const FromJsonFactory<Ingredient> fromJsonFactory = _$IngredientFromJson;
  final String? name;
  final int? quantity;

  const Ingredient({
    required this.name,
    required this.quantity,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) => _$IngredientFromJson(json);
}
