import 'package:hello_earth/commons/from_json_factory.dart';
import 'package:hello_earth/networking/models/player.dart';
import 'package:hello_earth/networking/models/user_networking.dart';

const Map<Type, FromJsonFactory> fromJsonFactories = {
  Player: Player.fromJsonFactory,
  UserNetworking: UserNetworking.fromJsonFactory,
};
