import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_earth/mappers/player_mappers.dart';
import 'package:hello_earth/mappers/shopping_list_mappers.dart';
import 'package:hello_earth/networking/models/base_response.dart';
import 'package:hello_earth/networking/models/player.dart';
import 'package:hello_earth/networking/models/shopping_list.dart';
import 'package:hello_earth/networking/requests/completed_mission_shopping_lists_request.dart';
import 'package:hello_earth/networking/requests/shopping_list_request.dart';
import 'package:hello_earth/pages/shopping_list/shopping_list_details/shopping_list_details_arguments.dart';
import 'package:hello_earth/repositories/family/family_repository.dart';
import 'package:hello_earth/repositories/shopping_list/shopping_list_repository.dart';
import 'package:hello_earth/ui/models/ingredient_model.dart';
import 'package:hello_earth/ui/models/player_model.dart';
import 'package:hello_earth/ui/models/shopping_list_model.dart';
import 'package:hello_earth/ui/models/user_model.dart';

part 'shopping_list_details_event.dart';

part 'shopping_list_details_state.dart';

class ShoppingListDetailsBloc extends Bloc<ShoppingListDetailsEvent, ShoppingListDetailsState> {
  final ShoppingListDetailsArguments? arguments;
  final FamilyRepository familyRepository;
  final UserModel? profile;
  final ShoppingListRepository shoppingListRepository;

  ShoppingListDetailsBloc({
    required this.arguments,
    required this.familyRepository,
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
    final String? familyId = profile?.familyId;
    if (familyId == null) return;
    try {
      shoppingListRepository.createShoppingList(
        familyUid: familyId,
        missionUid: arguments?.uid ?? '',
        shoppingListRequest: event.shoppingList?.mapToShoppingListRequest() ?? const ShoppingListRequest(),
      );
      final Iterable<IngredientModel?> unBoughtIngredients =
          event.shoppingList?.ingredients?.where((element) => !(element?.isBought ?? false)) ?? [];
      final BaseResponse<Player> response = await familyRepository.getPlayer(
        familyId: familyId,
      );
      final PlayerModel player = response.data.mapToPlayerModel();
      final List<String> completedShoppingLists = player.completedMissionShoppingLists ?? [];
      if (unBoughtIngredients.isEmpty) {
        completedShoppingLists.add(arguments?.uid ?? '');
      } else {
        completedShoppingLists.remove(arguments?.uid ?? '');
      }
      final CompletedMissionShoppingListsRequest completedMissionShoppingListsRequest =
          CompletedMissionShoppingListsRequest(
        completedMissionShoppingLists: completedShoppingLists,
      );
      shoppingListRepository.updateCompletedShoppingLists(
        familyId: familyId,
        completedMissionShoppingLists: completedMissionShoppingListsRequest,
      );
    } catch (error) {
      emit(
        const ShoppingListDetailsFailed(),
      );
    }
  }
}
