import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ilovasaqlash/SingIn.dart';
import 'package:ilovasaqlash/services/Auth.dart';
import 'package:ilovasaqlash/services/Pref.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  bool isLoading=false;
  _signUp(){
 String name=nameController.text.trim();
 String email=emailController.text.trim();
 String password=passwordController.text.trim();

 if(name.isEmpty||name.isEmpty||name.isEmpty){
  return;
 }
setState(() {
  isLoading=true;
});

  Auth.signUp(email, password).then((value){
    _saveUserId(value);
  setState(() {
    isLoading=false;
  });
  });
}
 _saveUserId(User? user)async {
   if(user!=null){
    await Pref.saveUserId(user.uid);
    Navigator.push(context,MaterialPageRoute(builder: ((context) => SignIn())));
   }else{
    ScaffoldMessenger(child: SnackBar(content: Text("Bironbir xatolik berdi?")),);
   }
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.all(20.0),
        child:!isLoading?
        Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Welcome SingUp",
                style: TextStyle(
                    fontSize: 50,
                    color: Colors.orange,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
             TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: "name"),
            ),
             SizedBox(
              height: 20,
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: "email"),
            ),
           SizedBox(
              height: 20,
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: "password",
              ),
            ),
           SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                  onPressed: () {
                    _signUp();
                  },
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.orange),
                  ),
                  child:  Text("SingIn")),
            ),
             SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 80.0),
                  child: Text("Don't  have an account? Sing Up"),
                ),
                TextButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: ((context) => const SignIn())));

                }, child: const Text("Sign Up"))
              ],
            )
          ],
        ):CircularProgressIndicator(
          color: Colors.orange,
        )
      )
    );
  }
}
