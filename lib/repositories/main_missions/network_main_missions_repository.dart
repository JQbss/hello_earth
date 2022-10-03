import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:hello_earth/networking/endpoints.dart';
import 'package:hello_earth/networking/models/base_response.dart';
import 'package:hello_earth/networking/models/main_missions.dart';
import 'package:hello_earth/repositories/main_missions/main_missions_repository.dart';

class NetworkMainMissionsRepository implements MainMissionsRepository {
  final DatabaseReference reference;

  const NetworkMainMissionsRepository({
    required this.reference,
  });

  @override
  Future<BaseResponse<MainMissions>> getMainMissions() async {
    final DataSnapshot dataSnapshot = await reference.child(Endpoints.missions.mainMissions).get();
    return BaseResponse<MainMissions>.fromJson(jsonDecode(jsonEncode(dataSnapshot.value ?? {})) as Map<String, dynamic>);
  }
}
