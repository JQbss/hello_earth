
import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:hello_earth/networking/endpoints.dart';
import 'package:hello_earth/networking/models/base_response.dart';
import 'package:hello_earth/networking/models/user_networking.dart';
import 'package:hello_earth/networking/requests/user_request.dart';
import 'package:hello_earth/repositories/user/user_repository.dart';

class NetworkUserRepository implements UserRepository {
  final DatabaseReference reference;

  const NetworkUserRepository({
    required this.reference,
  });

  @override
  Future<void> addUser({
    required UserRequest user,
    required String userId,
  }) async {
    await reference.child('${Endpoints.users.user}/$userId').set(user.toJson());
  }

  @override
  Future<BaseResponse<UserNetworking>> me({
    required String userId,
  }) async {
    final DataSnapshot dataSnapshot = await reference.child('${Endpoints.users.user}/$userId').get();
    return BaseResponse<UserNetworking>.fromJson(jsonDecode(jsonEncode(dataSnapshot.value)) as Map<String, dynamic>);
  }
}
