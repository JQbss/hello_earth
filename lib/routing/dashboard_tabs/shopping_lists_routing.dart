import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_earth/blocs/theme/theme_bloc.dart';
import 'package:hello_earth/blocs/user_data/user_data_bloc.dart';
import 'package:hello_earth/injector/injector.dart';
import 'package:hello_earth/pages/shopping_list/shopping_list_details/shopping_list_details_arguments.dart';
import 'package:hello_earth/pages/shopping_list/shopping_list_details/shopping_list_details_bloc.dart';
import 'package:hello_earth/pages/shopping_list/shopping_list_details/shopping_list_details_page.dart';
import 'package:hello_earth/pages/shopping_list/shopping_lists/shopping_lists_page.dart';
import 'package:hello_earth/repositories/shopping_list/network_shopping_list_repository.dart';
import 'package:hello_earth/routing/routing.dart';

class ShoppingListsRouting {
  static const String _prefix = 'shoppingLists';
  static const String shoppingLists = _prefix;
  static const String shoppingListDetails = '$_prefix/details';

  const ShoppingListsRouting._();

  static bool canHandleRoute(String? route) => Routing.canHandleRoute(route, _prefix);

  static Route? getMainRoute(RouteSettings settings) {
    final String? routeName = settings.name;
    final Widget child;
    switch (routeName) {
      case shoppingLists:
        child = ShoppingListsPage();
        break;
      case shoppingListDetails:
        child = BlocBuilder<ThemeBloc, ThemeState>(
          builder: (_, __) {
            return BlocProvider<ShoppingListDetailsBloc>(
              create: (context) => ShoppingListDetailsBloc(
                arguments: settings.arguments as ShoppingListDetailsArguments?,
                profile: BlocProvider.of<UserDataBloc>(context).state.profile,
                shoppingListRepository: Injector().get<NetworkShoppingListRepository>(),
              ),
              child: ShoppingListDetailsPage(),
            );
          },
        );
        break;
      default:
        return null;
    }
    return Routing.buildRoute(
      child: child,
      settings: settings,
    );
  }
}
