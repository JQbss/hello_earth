import 'package:hello_earth/commons/from_json_factory.dart';
import 'package:hello_earth/networking/models/ingredient.dart';
import 'package:hello_earth/networking/models/level.dart';
import 'package:hello_earth/networking/models/main_missions.dart';
import 'package:hello_earth/networking/models/mission.dart';
import 'package:hello_earth/networking/models/player.dart';
import 'package:hello_earth/networking/models/shopping_list.dart';
import 'package:hello_earth/networking/models/step_networking.dart';
import 'package:hello_earth/networking/models/user_networking.dart';

const Map<Type, FromJsonFactory> fromJsonFactories = {
  Ingredient: Ingredient.fromJsonFactory,
  Level: Level.fromJsonFactory,
  MainMissions: MainMissions.fromJsonFactory,
  Mission: Mission.fromJsonFactory,
  Player: Player.fromJsonFactory,
  ShoppingList: ShoppingList.fromJsonFactory,
  StepNetworking: StepNetworking.fromJsonFactory,
  UserNetworking: UserNetworking.fromJsonFactory,
};
