import "package:firebase_auth/firebase_auth.dart";

class AuthenticationService {
  static AuthenticationService _instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User user;

  AuthenticationService._internal();

  static AuthenticationService getInstance() {
    if (_instance == null) {
      _instance = AuthenticationService._internal();
    }
    return _instance;
  }

  Future<void> registrar (String email, String password) async {
    await _auth.createUserWithEmailAndPassword(
      email: email, 
      password: password
    ).then((user) {
      print(user);
    }).catchError((e) => print(e));
  }

  Future<bool> logar (String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password
      ).then((value) {
        user = value.user;
        print(user.uid);
      });
    } catch (e) {
      print(e);
      return false;
    }
    return true;
  }


}