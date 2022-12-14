import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:hello_earth/networking/models/base_response.dart';
import 'package:hello_earth/networking/models/parent.dart';
import 'package:hello_earth/networking/models/player.dart';
import 'package:hello_earth/networking/requests/family_request.dart';
import 'package:hello_earth/networking/requests/finish_questionnaire_request.dart';
import 'package:hello_earth/networking/requests/player_request.dart';

abstract class FamilyRepository {
  Future<void> addPlayer({
    required String familyId,
    required PlayerRequest playerRequest,
  });

  Future<void> createFamily({
    required FamilyRequest family,
    required String uid,
  });

  Future<BaseResponse<Player>> getPlayer({
    required String familyId,
  });

  Stream<DatabaseEvent> getPlayerSubscription({
    required String familyId,
  });

  Future<BaseResponse<Parent>> getParent({
    required String familyId,
  });

  Stream<DatabaseEvent> getParentSubscription({
    required String familyId,
  });


  Future<bool> isFamilyExists({
    required String uid,
  });

  Future<bool> isUserExists({
    required String uid,
  });

  Future<void> updateQuestionnaire({
    required String familyId,
    required FinishQuestionnaireRequest questionnaireRequest,
  });
}
