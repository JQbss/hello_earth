import 'package:hello_earth/networking/models/base_response.dart';
import 'package:hello_earth/networking/models/shopping_list.dart';
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
}
