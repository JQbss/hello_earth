import 'package:json_annotation/json_annotation.dart';

part 'completed_mission_shopping_lists_request.g.dart';

@JsonSerializable(
  createFactory: false,
)
class CompletedMissionShoppingListsRequest {
  final List<String> completedMissionShoppingLists;

  const CompletedMissionShoppingListsRequest({
    required this.completedMissionShoppingLists,
  });

  Map<String, dynamic> toJson() => _$CompletedMissionShoppingListsRequestToJson(this);
}
