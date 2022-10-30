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
}
