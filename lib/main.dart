import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ilovasaqlash/HomePage.dart';
import 'package:ilovasaqlash/SingIn.dart';
import 'package:ilovasaqlash/services/Pref.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool? isLogin = false;
  login() async {
    String? id = await Pref.getUserId();
    setState(() {
       if (id == null) {
      isLogin = false;
    } else {
      isLogin = true;
    }
    });
   
  }

  @override
  void initState() {
    super.initState();
    login();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: isLogin!? HomePage() : SignIn(),
    );
  }
}
