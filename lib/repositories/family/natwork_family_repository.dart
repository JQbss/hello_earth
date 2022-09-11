import 'package:firebase_database/firebase_database.dart';
import 'package:hello_earth/networking/endpoints.dart';
import 'package:hello_earth/repositories/family/family_repository.dart';

class NetworkFamilyRepository implements FamilyRepository {
  final DatabaseReference reference;

  const NetworkFamilyRepository({
    required this.reference,
  });

  @override
  Future<bool> isFamilyExists({required String uid}) async {
    final DatabaseEvent event = await reference.child('${Endpoints.families}/$uid').once();
    return event.snapshot.exists;
  }
}
