import 'package:firebase_auth/firebase_auth.dart';

class AuthService
{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //auth change user stream
  Stream<User> get user
  {
    return _auth.authStateChanges();
  }

  //signin email password
  Future signinEmailPassword(String email, String password) async
  {
    try
    {
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    }
    catch(e)
    {
      return null;
    }
  }

  //singup email password
  Future signupEmailPassword(Map<String, String> data) async
  {
    try
    {
      return await _auth.createUserWithEmailAndPassword(email: data["email"], password: data["password"]);
    }
    catch(e)
    {
      return null;
    }
  }
}