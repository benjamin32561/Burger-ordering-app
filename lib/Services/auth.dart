import 'package:firebase_auth/firebase_auth.dart';

class AuthService
{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //sign in email & password

  //register with email & password
  Future signupEmailPass(Map<String,String> data) async
  {
    try
    {
      final user = await _auth.createUserWithEmailAndPassword(email: data["email"], password: data["password"]);
      if (user != null)
      {

      }
    }
    catch(e)
    {
      print(e);
    }
  }

  //sign up with google

}
