import 'package:json_annotation/json_annotation.dart';

part 'parent_request.g.dart';

@JsonSerializable(
  createFactory: false,
)
class ParentRequest {
  final String uid;

  const ParentRequest({
    required this.uid,
  });

  Map<String, dynamic> toJson() => _$ParentRequestToJson(this);
}
