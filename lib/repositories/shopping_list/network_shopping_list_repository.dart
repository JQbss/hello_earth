import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:hello_earth/networking/endpoints.dart';
import 'package:hello_earth/networking/models/base_response.dart';
import 'package:hello_earth/networking/models/shopping_list.dart';
import 'package:hello_earth/networking/models/shopping_lists.dart';
import 'package:hello_earth/networking/requests/completed_mission_shopping_lists_request.dart';
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
        .child('${Endpoints.families.families}/$familyUid/${Endpoints.shoppingLists.shoppingLists}/$missionUid')
        .set(shoppingListRequest.toJson());
  }

  @override
  Future<bool> isShoppingListExists({
    required String familyUid,
    required String missionUid,
  }) async {
    final DatabaseEvent event = await reference
        .child('${Endpoints.families.families}/$familyUid/${Endpoints.shoppingLists.shoppingLists}/$missionUid')
        .once();
    return event.snapshot.exists;
  }

  @override
  Future<BaseResponse<ShoppingList>> getShoppingList({
    required String familyUid,
    required String missionUid,
  }) async {
    final DataSnapshot dataSnapshot = await reference
        .child('${Endpoints.families.families}/$familyUid/${Endpoints.shoppingLists.shoppingLists}/$missionUid')
        .get();
    return BaseResponse<ShoppingList>.fromJson(jsonDecode(jsonEncode(dataSnapshot.value)) as Map<String, dynamic>);
  }

  @override
  Future<ShoppingLists> getAllShoppingLists({required String familyUid}) async {
    final DataSnapshot dataSnapshot = await reference
        .child('${Endpoints.families.families}/$familyUid/${Endpoints.shoppingLists.shoppingLists}')
        .get();
    final Map<String, dynamic> values = jsonDecode(jsonEncode(dataSnapshot.value)) as Map<String, dynamic>;
    final Map<String, ShoppingList> shoppingLists = values
        .map((key, value) => MapEntry(key, BaseResponse<ShoppingList>.fromJson(value as Map<String, dynamic>).data));
    final ShoppingLists allShoppingList = ShoppingLists(shoppingLists: shoppingLists);
    return allShoppingList;
  }

  @override
  Future<void> updateCompletedShoppingLists({
    required String familyId,
    required CompletedMissionShoppingListsRequest completedMissionShoppingLists,
  }) async {
    await reference
        .child(
            '${Endpoints.families.families}/${familyId}/${Endpoints.families.player}')
        .update(completedMissionShoppingLists.toJson());
  }
}
