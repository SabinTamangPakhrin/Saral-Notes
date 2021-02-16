import 'package:firebase_auth/firebase_auth.dart';

class Authentication {
  FirebaseAuth auth = FirebaseAuth.instance;
  Future<bool> signUp(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return true;
    } on FirebaseException catch (e) {
      print('Failed with error code: ${e.code}');
      print(e.message);
      return false;
    }
  }

  Future<bool> signIn(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      print('Failed with error code: ${e.code}');
      print(e.message);
      return false;
    }
  }

  Future<bool> logout() async {
    try {
      await auth.signOut();
      return true;
    } on FirebaseAuthException catch (e) {
      print('Failed with error code: ${e.code}');
      print(e.message);
      return false;
    }
  }
}
