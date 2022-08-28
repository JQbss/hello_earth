import 'package:json_annotation/json_annotation.dart';

part 'credential_request.g.dart';

@JsonSerializable(
  createFactory: false,
)
class CredentialRequest {
  final String email;
  final String password;

  const CredentialRequest({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => _$CredentialRequestToJson(this);
}
