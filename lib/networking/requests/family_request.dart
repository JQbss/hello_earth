import 'package:hello_earth/networking/requests/parent_request.dart';
import 'package:json_annotation/json_annotation.dart';

part 'family_request.g.dart';

@JsonSerializable(
  createFactory: false,
)
class FamilyRequest {
  final ParentRequest parent;

  const FamilyRequest({
    required this.parent,
  });

  Map<String, dynamic> toJson() => _$FamilyRequestToJson(this);
}
