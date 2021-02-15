import 'package:firebase_auth/firebase_auth.dart';

class Authentication {
  FirebaseAuth auth = FirebaseAuth.instance;
  Future<void> signUp(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseException catch (e) {
      print('Failed with error code: ${e.code}');
      print(e.message);
    }
  }

  void signIn() {}
}
