import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ilovasaqlash/HomePage.dart';
import 'package:ilovasaqlash/SingUp.dart';
import 'package:ilovasaqlash/services/Auth.dart';
import 'package:ilovasaqlash/services/Pref.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool? isLoading = false;
  _signIn() {
    setState(() {
      isLoading = true;
    });
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    if (email.isEmpty|| password.isEmpty) {
      return;
    }
    Auth.signIn(email, password).then((user) {
      saveUserId(user);
      
    });
  }

  saveUserId(User? user) async {
    setState(() {
      isLoading = false;
    });
    if (user != null) {
      await Pref.saveUserId(user.uid);
      Navigator.push(
          context, MaterialPageRoute(builder: ((context) => HomePage())));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("email yoki parol xato")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.all(16.0),
          child: !isLoading!
              ? Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            "Welcome SignIn",
                            style: TextStyle(
                                fontSize: 50,
                                color: Colors.orange,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                          controller: emailController,
                          decoration: InputDecoration(labelText: "email"),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            labelText: "password",
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                              onPressed: () {
                                _signIn();
                              },
                              style: const ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(Colors.orange)),
                              child: const Text("SingIn")),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 86.0),
                              child: Text("Don't  have an account? Sing Up"),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              const SignUp())));
                                },
                                child: const Text("Sign Up"))
                          ],
                        )
                      ],
                    ),
                  ],
                )
              : CircularProgressIndicator(
                  color: Colors.orange,
                )),
    );
  }
}
