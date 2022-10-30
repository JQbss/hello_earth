import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hello_earth/mappers/shopping_list_mappers.dart';
import 'package:hello_earth/networking/requests/shopping_list_request.dart';
import 'package:hello_earth/pages/shopping_list/shopping_list_details/shopping_list_details_arguments.dart';
import 'package:hello_earth/repositories/shopping_list/shopping_list_repository.dart';
import 'package:hello_earth/ui/models/user_model.dart';

part 'shopping_list_details_event.dart';

part 'shopping_list_details_state.dart';

class ShoppingListDetailsBloc extends Bloc<ShoppingListDetailsEvent, ShoppingListDetailsState> {
  final ShoppingListDetailsArguments? arguments;
  final UserModel? profile;
  final ShoppingListRepository shoppingListRepository;

  ShoppingListDetailsBloc({
    required this.arguments,
    required this.profile,
    required this.shoppingListRepository,
  }) : super(ShoppingListDetailsInitial()) {
    on<FetchShoppingList>(_onFetchShoppingList);
  }

  Future<void> _onFetchShoppingList(
    FetchShoppingList event,
    Emitter<ShoppingListDetailsState> emit,
  ) async {
    emit(
      ShoppingListDetailsLoading(),
    );
    try {
      final bool isShoppListExists = await shoppingListRepository.isShoppingListExists(
        familyUid: profile?.familyId ?? '',
        missionUid: arguments?.uid ?? '',
      );
      if (isShoppListExists) {
        print('tadaaaa');
      } else {
        await shoppingListRepository.createShoppingList(
          familyUid: profile?.familyId ?? '',
          missionUid: arguments?.uid ?? '',
          shoppingListRequest: arguments?.mapToShoppingListRequest() ?? ShoppingListRequest(),
        );
      }
    } catch (error) {
      emit(
        ShoppingListDetailsFailed(),
      );
    }
  }
}
