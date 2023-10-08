import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  static String id = "registerpage";
  String? email;
  String? password;
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Chat App"),
            Text("Register"),
            CustomTextField(
              onChanged: (data) {
                email = data;
              },
              hintText: "Email",
            ),
            CustomTextField(
              onChanged: (data) {
                password = data;
              },
              hintText: "Password",
            ),
            CutomButton(
              onTap: () async {
                try {
                  await RegisterUser();

                  //  print(userCredential.user!.displayName);
                } on FirebaseAuthException catch (e) {
                  if (e.code == "weak-password") {
                    ShowSnackBar(context, "Weak Password");
                  } else if (e.code == "email-already-in-use") {
                    ShowSnackBar(context, "Email Already Exists");
                    print(e);
                  }
                }
                                ShowSnackBar(context, "Success");

              },
              title: "Register",
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already Have Account"),
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text("  Login"))
              ],
            )
          ],
        ),
      ),
    );
  }

  void ShowSnackBar(BuildContext context, String Message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(Message)));
  }

  Future<void> RegisterUser() async {
    //var auth = FirebaseAuth.instance;
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}
