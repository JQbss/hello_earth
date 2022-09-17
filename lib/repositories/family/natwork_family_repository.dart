import 'package:firebase_database/firebase_database.dart';
import 'package:hello_earth/networking/endpoints.dart';
import 'package:hello_earth/networking/requests/family_request.dart';
import 'package:hello_earth/repositories/family/family_repository.dart';

class NetworkFamilyRepository implements FamilyRepository {
  final DatabaseReference reference;

  const NetworkFamilyRepository({
    required this.reference,
  });

  @override
  Future<void> createFamily({
    required FamilyRequest family,
    required String uid,
  }) async {
    await reference.child('${Endpoints.families.families}/$uid').set(family.toJson());
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
}
