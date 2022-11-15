import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_earth/mappers/shopping_list_mappers.dart';
import 'package:hello_earth/networking/models/shopping_lists.dart';
import 'package:hello_earth/repositories/shopping_list/shopping_list_repository.dart';
import 'package:hello_earth/ui/models/shopping_lists_model.dart';
import 'package:hello_earth/ui/models/user_model.dart';

part 'shopping_lists_event.dart';

part 'shopping_lists_state.dart';

class ShoppingListsBloc extends Bloc<ShoppingListsEvent, ShoppingListsState> {
  final UserModel? profile;
  final ShoppingListRepository shoppingListRepository;

  ShoppingListsBloc({
    required this.profile,
    required this.shoppingListRepository,
  }) : super(const ShoppingListsInitial()) {
    on<ShoppingListFetchData>(_onShoppingListFetchData);
  }

  Future<void> _onShoppingListFetchData(
    ShoppingListFetchData event,
    Emitter<ShoppingListsState> emit,
  ) async {
    try {
      final ShoppingLists response = await shoppingListRepository.getAllShoppingLists(
        familyUid: profile?.familyId ?? '',
      );
      emit(
        ShoppingListsSuccess(
          shoppingLists: response.mapToShoppingListsModel(),
        ),
      );
    } catch (error) {
      emit(
        const ShoppingListsFailed(),
      );
    }
  }
}
