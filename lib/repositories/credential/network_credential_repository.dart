import 'package:firebase_auth/firebase_auth.dart';
import 'package:hello_earth/networking/requests/credential_request.dart';
import 'package:hello_earth/repositories/credential/credential_repository.dart';

class NetworkCredentialRepository implements CredentialRepository {
  final FirebaseAuth auth;

  const NetworkCredentialRepository({
    required this.auth,
  });

  @override
  Future<UserCredential> createUser(CredentialRequest credentialRequest) async {
    final UserCredential credential = await auth.createUserWithEmailAndPassword(
      email: credentialRequest.email,
      password: credentialRequest.password,
    );
    return credential;
  }

  @override
  User? currentFirebaseUser() {
    return auth.currentUser;
  }

  @override
  Future<UserCredential> signInUser(CredentialRequest credentialRequest) async {
    final UserCredential credential = await auth.signInWithEmailAndPassword(
      email: credentialRequest.email,
      password: credentialRequest.password,
    );
    return credential;
  }

  @override
  Future<void> signOut() async {
    await auth.signOut();
  }
}
