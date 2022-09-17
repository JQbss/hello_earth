import 'package:hello_earth/networking/requests/family_request.dart';

abstract class FamilyRepository {
  Future<void> createFamily({
    required FamilyRequest family,
    required String uid,
  });

  Future<bool> isFamilyExists({
    required String uid,
  });

  Future<bool> isUserExists({
    required String uid,
  });
}
