import 'package:hello_earth/networking/models/base_response.dart';
import 'package:hello_earth/networking/models/user_networking.dart';
import 'package:hello_earth/networking/requests/user_request.dart';

abstract class UserRepository {
  Future<void> addUser({
    required UserRequest user,
    required String userId,
  });

  Future<BaseResponse<UserNetworking>> me({
    required String userId,
  });
}
