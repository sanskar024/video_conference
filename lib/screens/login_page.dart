
import 'package:flutter/material.dart';
import 'package:video_conference/resources/auth.dart';
import 'package:video_conference/widgets/button.dart';
import 'package:video_conference/screens/home.dart';// Assuming this is the correct path for your Button widget
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
   // Renamed Auth to AuthMethods
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
            
        Button( data: 'Login', onPressed: ()async{
          Auth auth = Auth();
          final user = await auth.signInWithGoogle();
          if(user != null){
            print("Logged IN");
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const Home()));
          }else{
            print("Login Failed");
          }
        },),
          ],
        ),
      )
    );
  }
}