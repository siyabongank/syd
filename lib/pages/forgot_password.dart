import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:syd/components/my_button.dart';
import 'package:syd/components/my_text_field.dart';
import 'package:syd/pages/login_page.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final emailController = TextEditingController();
  @override
  void dispose(){
    emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async{
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text.trim());
      showDialog(context: context, builder: (context){
        return AlertDialog(
          title: Text('Error'),
          content: Text('Password reset link sent! check your email'),
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text('OK'))
          ],
        );
      });
    }on FirebaseAuthException catch(e){
      print(e);
      showDialog(context: context, builder: (context){
        return AlertDialog(
          title: Text('Error'),
          content: Text(e.message.toString()),
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text('OK'))
          ],
        );
      });
    }
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage(onTap: () {})),
                            (route) => false,
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey[100],
                          ),
                          child: Center(
                            child: Icon(
                              Icons.arrow_back,
                              size: 20,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  Image.asset(
                    'lib/img/fogot_password.webp',
                    height: 350,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Forgot Password?',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Don't worry it happens sometimes 😊, Enter your email and we'll send you a password reset link",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black54,
                    )
                  ),
                  const SizedBox(height: 25),
                  MyTextField(controller: emailController, hintText: 'Email', obscureText: false),
                  const SizedBox(height: 25),
                  MyButton(onTap: passwordReset, text: 'Send'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
