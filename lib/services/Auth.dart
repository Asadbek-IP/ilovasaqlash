import 'package:firebase_auth/firebase_auth.dart';
import 'package:ilovasaqlash/services/Pref.dart';

class Auth{
  static final _auth=FirebaseAuth.instance;
  static Future <User>signIn(String email,String password)async{
    try{
      _auth.signInWithEmailAndPassword(email: email, password: password);
      final User user=await _auth.currentUser!;
      return user;
    }catch(error){
      print(error);
    }  
      return null!;
  }
  static Future<User?> signUp(String email,String password)async{
    try{
     UserCredential _singilUpresuld=await _auth.createUserWithEmailAndPassword(email: email, password: password);
     return _singilUpresuld.user!;
  }catch(error){
    print(error);
  }
  return null;
}
static logount()async{
  await  _auth.signOut();
  await Pref.clear();
}
}