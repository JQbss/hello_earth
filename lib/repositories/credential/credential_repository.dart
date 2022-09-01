import 'package:firebase_auth/firebase_auth.dart';
import 'package:hello_earth/networking/requests/credential_request.dart';

abstract class CredentialRepository {
  Future<UserCredential> createUser(CredentialRequest credential);

  User? currentFirebaseUser();

  Future<UserCredential> signInUser(CredentialRequest credential);

  Future<void> signOut();
}
