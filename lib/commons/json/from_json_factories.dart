import 'package:hello_earth/commons/from_json_factory.dart';
import 'package:hello_earth/networking/models/user_networking.dart';

const Map<Type, FromJsonFactory> fromJsonFactories = {
  UserNetworking: UserNetworking.fromJsonFactory,
};
