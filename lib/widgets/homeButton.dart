import 'package:flutter/material.dart';
import 'package:video_conference/utils/color.dart';
class Homebutton extends StatelessWidget {
 final VoidCallback onTap; // declare the callback
final IconData icon;
final String text;
  const Homebutton({
    super.key,
    required this.onTap, 
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(16),
              boxShadow:[BoxShadow(
                blurRadius:  10,
                  color: Colors.black.withOpacity(.06),
                  offset: const Offset(0,4),
            ),]
             
            ),
            width: 60,
            height: 60,
            child: Icon(icon,color: Colors.white,size: 30, ),
          ),
          const SizedBox(height: 10,),
          Text(text,style: const TextStyle(color: Colors.grey),),
        ],
      ),


 
      
    );
  }
}