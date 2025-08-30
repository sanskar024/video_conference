import 'package:flutter/material.dart';
import 'package:video_conference/utils/color.dart';
class Button extends StatelessWidget {
  final String data;
  final VoidCallback onPressed ;
  const Button( {super.key,required this.data,required this.onPressed});

  @override 
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: ElevatedButton(onPressed: (){onPressed;}, child: Text(data,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.white),),
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor, // fixed
        minimumSize: const Size(double.infinity, 50),
      ),
      
      ),
    );
  }
}
