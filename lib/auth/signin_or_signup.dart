import 'package:flutter/material.dart';
import 'package:syd/pages/login_page.dart';
import 'package:syd/pages/register_page.dart';

class SigninOrSignup extends StatefulWidget {
  const SigninOrSignup({super.key});

  @override
  State<SigninOrSignup> createState() => _SigninOrSignupState();
}

class _SigninOrSignupState extends State<SigninOrSignup> {
  //initally show the index page
  bool showIndexPage = true;
  //toggle between pages
  void togglePages(){
    setState(() {
      showIndexPage = !showIndexPage;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(showIndexPage){
      return LoginPage(onTap: togglePages);
    }else{
      return RegisterPage(onTap: togglePages);
    }
  }
}