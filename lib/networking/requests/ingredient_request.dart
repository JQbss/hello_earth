import 'package:json_annotation/json_annotation.dart';

part 'ingredient_request.g.dart';

@JsonSerializable(
  createFactory: false,
  explicitToJson: true,
)
class IngredientRequest {
  final bool? isBought;
  final String? name;
  final int? quantity;

  const IngredientRequest({
    this.isBought,
    this.name,
    this.quantity,
  });

  Map<String, dynamic> toJson() => _$IngredientRequestToJson(this);
}
