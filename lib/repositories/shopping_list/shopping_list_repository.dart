import 'package:hello_earth/networking/models/base_response.dart';
import 'package:hello_earth/networking/models/shopping_list.dart';
import 'package:hello_earth/networking/models/shopping_lists.dart';
import 'package:hello_earth/networking/requests/completed_mission_shopping_lists_request.dart';
import 'package:hello_earth/networking/requests/shopping_list_request.dart';

abstract class ShoppingListRepository {
  Future<void> createShoppingList({
    required String familyUid,
    required String missionUid,
    required ShoppingListRequest shoppingListRequest,
  });

  Future<bool> isShoppingListExists({
    required String familyUid,
    required String missionUid,
  });

  Future<BaseResponse<ShoppingList>> getShoppingList({
    required String familyUid,
    required String missionUid,
  });

  Future<ShoppingLists> getAllShoppingLists({
    required String familyUid,
  });

  Future<void> updateCompletedShoppingLists({
    required String familyId,
    required CompletedMissionShoppingListsRequest completedMissionShoppingLists,
  });

  Future<void> removeShoppingList({
    required String familyUid,
    required String missionUid,
  });
}
