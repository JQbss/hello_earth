import 'package:firebase_database/firebase_database.dart';
import 'package:hello_earth/networking/endpoints.dart';
import 'package:hello_earth/networking/requests/shopping_list_request.dart';
import 'package:hello_earth/repositories/shopping_list/shopping_list_repository.dart';

class NetworkShoppingListRepository implements ShoppingListRepository {
  final DatabaseReference reference;

  const NetworkShoppingListRepository({
    required this.reference,
  });

  @override
  Future<void> createShoppingList({
    required String familyUid,
    required String missionUid,
    required ShoppingListRequest shoppingListRequest,
  }) async {
    await reference
        .child('${Endpoints.families.families}/$familyUid/${Endpoints.shoppingLists.shoppingLists}/${missionUid}')
        .set(shoppingListRequest.toJson());
  }

  @override
  Future<bool> isShoppingListExists({
    required String familyUid,
    required String missionUid,
  }) async {
    final DatabaseEvent event = await reference
        .child('${Endpoints.families.families}/$familyUid/${Endpoints.shoppingLists.shoppingLists}/${missionUid}')
        .once();
    return event.snapshot.exists;
  }
}
