import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ilovasaqlash/SingIn.dart';
import 'package:ilovasaqlash/services/Auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
            width: 100,
            height: 50,
            child: ElevatedButton(
                onPressed: () {
                  Auth.logount().then(
                      (context),
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) => SignIn()))));
                },
                child: Text("Logount"))),
      ),
    );
  }
}
