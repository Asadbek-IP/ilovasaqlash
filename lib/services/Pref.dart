import 'package:shared_preferences/shared_preferences.dart';

class Pref{
  static  Future saveUserId(String id)async{
    SharedPreferences _pref=await SharedPreferences.getInstance();
     _pref.setString("user_id", id);
  }
  static Future getUserId()async{
    SharedPreferences _pref=await SharedPreferences.getInstance();
    _pref.getString("user_id");
  }
  static Future clear()async{
   SharedPreferences _pref=await SharedPreferences.getInstance();
   _pref.clear();
  }
}