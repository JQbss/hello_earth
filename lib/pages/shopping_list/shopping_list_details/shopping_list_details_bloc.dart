import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_earth/mappers/shopping_list_mappers.dart';
import 'package:hello_earth/networking/models/base_response.dart';
import 'package:hello_earth/networking/models/shopping_list.dart';
import 'package:hello_earth/networking/requests/shopping_list_request.dart';
import 'package:hello_earth/pages/shopping_list/shopping_list_details/shopping_list_details_arguments.dart';
import 'package:hello_earth/repositories/shopping_list/shopping_list_repository.dart';
import 'package:hello_earth/ui/models/shopping_list_model.dart';
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
  }) : super(const ShoppingListDetailsInitial()) {
    on<FetchShoppingList>(_onFetchShoppingList);
    on<ShoppingListChanged>(_onShoppingListChanged);
  }

  Future<void> _onFetchShoppingList(
    FetchShoppingList event,
    Emitter<ShoppingListDetailsState> emit,
  ) async {
    emit(
      const ShoppingListDetailsLoading(),
    );
    try {
      final bool isShoppListExists = await shoppingListRepository.isShoppingListExists(
        familyUid: profile?.familyId ?? '',
        missionUid: arguments?.uid ?? '',
      );
      if (!isShoppListExists) {
        shoppingListRepository.createShoppingList(
          familyUid: profile?.familyId ?? '',
          missionUid: arguments?.uid ?? '',
          shoppingListRequest: arguments?.mapToShoppingListRequest() ?? const ShoppingListRequest(),
        );
        emit(
          ShoppingListDetailsSuccess(
            shoppingList: arguments?.mapToShoppingListFromArguments(),
          ),
        );
      } else {
        final BaseResponse<ShoppingList> response = await shoppingListRepository.getShoppingList(
          familyUid: profile?.familyId ?? '',
          missionUid: arguments?.uid ?? '',
        );
        emit(
          ShoppingListDetailsSuccess(
            shoppingList: response.data.mapToShoppingListModel(),
          ),
        );
      }
    } catch (error) {
      emit(
        const ShoppingListDetailsFailed(),
      );
    }
  }

  Future<void> _onShoppingListChanged(
    ShoppingListChanged event,
    Emitter<ShoppingListDetailsState> emit,
  ) async {
    try {
      shoppingListRepository.createShoppingList(
        familyUid: profile?.familyId ?? '',
        missionUid: arguments?.uid ?? '',
        shoppingListRequest: event.shoppingList?.mapToShoppingListRequest() ?? const ShoppingListRequest(),
      );
    } catch (error) {
      emit(
        const ShoppingListDetailsFailed(),
      );
    }
  }
}
