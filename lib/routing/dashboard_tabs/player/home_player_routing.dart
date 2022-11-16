import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_earth/blocs/theme/theme_bloc.dart';
import 'package:hello_earth/blocs/user_data/user_data_bloc.dart';
import 'package:hello_earth/injector/injector.dart';
import 'package:hello_earth/pages/player/home_player/home_player_bloc.dart';
import 'package:hello_earth/pages/player/home_player/home_player_page.dart';
import 'package:hello_earth/pages/player/player_mission/player_mission_arguments.dart';
import 'package:hello_earth/pages/player/player_mission/player_mission_bloc.dart';
import 'package:hello_earth/pages/player/player_mission/player_mission_page.dart';
import 'package:hello_earth/repositories/family/natwork_family_repository.dart';
import 'package:hello_earth/repositories/main_missions/network_main_missions_repository.dart';
import 'package:hello_earth/repositories/mission/network_mission_repository.dart';
import 'package:hello_earth/repositories/shopping_list/network_shopping_list_repository.dart';
import 'package:hello_earth/routing/routing.dart';

class HomePlayerRouting {
  static const String _prefix = 'homePlayer';
  static const String home = _prefix;
  static const String mission = '$home/mission';

  const HomePlayerRouting._();

  static bool canHandleRoute(String? routeName) => Routing.canHandleRoute(routeName, _prefix);

  static Route? getMainRoute(RouteSettings settings) {
    final String? routeName = settings.name;
    final Widget child;
    switch (routeName) {
      case home:
        child = BlocBuilder<ThemeBloc, ThemeState>(
          builder: (_, __) {
            return BlocProvider<HomePlayerBloc>(
              create: (context) => HomePlayerBloc(
                familyRepository: Injector().get<NetworkFamilyRepository>(),
                mainMissionsRepository: Injector().get<NetworkMainMissionsRepository>(),
                missionRepository: Injector().get<NetworkMissionRepository>(),
                profile: BlocProvider.of<UserDataBloc>(context).state.profile,
              ),
              child: HomePlayerPage(),
            );
          },
        );
        break;
      case mission:
        child = BlocBuilder<ThemeBloc, ThemeState>(
          builder: (_, __) {
            return BlocProvider<PlayerMissionBloc>(
              create: (context) => PlayerMissionBloc(
                arguments: settings.arguments as PlayerMissionArguments?,
                missionRepository: Injector().get<NetworkMissionRepository>(),
                profile: BlocProvider.of<UserDataBloc>(context).state.profile,
                shoppingListRepository: Injector().get<NetworkShoppingListRepository>(),
              ),
              child: PlayerMissionPage(),
            );
          },
        );
        break;
      default:
        return null;
    }

    return Routing.buildRoute(
      child: child,
      fullscreenDialog: false,
      settings: settings,
    );
  }
}
