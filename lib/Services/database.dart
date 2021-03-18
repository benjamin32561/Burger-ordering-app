import 'package:cloud_firestore/cloud_firestore.dart';
import 'auth.dart';

class DatabaseService
{
  final CollectionReference usersCollection = FirebaseFirestore.instance.collection("users");

  void addDataToUser(Map<String, String> data)
  {
    AuthService ac = AuthService();
    Map<String, dynamic> to_send = {
      "first name": data["first_name"],
      "last name": data["last_name"],
      "uid": ac.userObject.uid,
    };
    usersCollection.add(to_send);
  }
}