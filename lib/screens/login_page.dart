import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:video_conference/widgets/button.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
            const Text("Join Meeting",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 38.0),
            
              child: Image.asset('assets/images/onboarding.jpg'),
            ),
            
        Button( data: 'Login', onPressed: (){},),
          ],
        ),
      )
    );
  }
}