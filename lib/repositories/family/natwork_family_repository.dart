import 'dart:async';
import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:hello_earth/networking/endpoints.dart';
import 'package:hello_earth/networking/models/base_response.dart';
import 'package:hello_earth/networking/models/player.dart';
import 'package:hello_earth/networking/requests/family_request.dart';
import 'package:hello_earth/networking/requests/finish_questionnaire_request.dart';
import 'package:hello_earth/networking/requests/player_request.dart';
import 'package:hello_earth/repositories/family/family_repository.dart';

class NetworkFamilyRepository implements FamilyRepository {
  final DatabaseReference reference;

  const NetworkFamilyRepository({
    required this.reference,
  });

  @override
  Future<void> addPlayer({
    required String familyId,
    required PlayerRequest playerRequest,
  }) async {
    await reference
        .child('${Endpoints.families.families}/${familyId}/${Endpoints.families.player}')
        .update(playerRequest.toJson());
  }

  @override
  Future<void> createFamily({
    required FamilyRequest family,
    required String uid,
  }) async {
    await reference.child('${Endpoints.families.families}/$uid').set(family.toJson());
  }

  @override
  Future<BaseResponse<Player>> getPlayer({
    required String familyId,
  }) async {
    final DataSnapshot dataSnapshot =
        await reference.child('${Endpoints.families.families}/${familyId}/${Endpoints.families.player}').get();
    return BaseResponse<Player>.fromJson(jsonDecode(jsonEncode(dataSnapshot.value)) as Map<String, dynamic>);
  }

  @override
  Stream<DatabaseEvent> getPlayerSubscription({
    required String familyId,
  }) {
    return reference.child('${Endpoints.families.families}/${familyId}/${Endpoints.families.player}').onValue;
  }

  @override
  Future<bool> isFamilyExists({
    required String uid,
  }) async {
    final DatabaseEvent event = await reference.child('${Endpoints.families.families}/$uid').once();
    return event.snapshot.exists;
  }

  @override
  Future<bool> isUserExists({
    required String uid,
  }) async {
    final DatabaseEvent event =
        await reference.child('${Endpoints.families.families}/$uid/${Endpoints.families.player}').once();
    return event.snapshot.exists;
  }

  @override
  Future<void> updateQuestionnaire({
    required String familyId,
    required FinishQuestionnaireRequest questionnaireRequest,
  }) async {
    await reference
        .child('${Endpoints.families.families}/${familyId}/${Endpoints.families.player}')
        .update(questionnaireRequest.toJson());
  }
}
