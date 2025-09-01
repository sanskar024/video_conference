import "package:flutter/material.dart";
import "package:video_conference/resources/Jetsi.dart";
import "package:video_conference/widgets/homeButton.dart";
import 'package:video_conference/resources/Jetsi.dart';
class Metting extends StatelessWidget {
  const Metting({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
    Homebutton( onTap: () => Jetsi().createMeeting(isAudioMuted: true, isvideoOFF: true,roomname: "Eshu"),icon: Icons.videocam,text: "New Meeting"),
    Homebutton( onTap: (){},icon: Icons.add_box_rounded,text: " Join Meeting" ),
     Homebutton( onTap: (){},icon: Icons.calendar_today,text: "Schdeule",),
    Homebutton( onTap: (){},icon: Icons.arrow_upward,text: "Share Screen",),
        
    
          ],
    
    
    ),Expanded(child: Center(child: Text("Create or Join Metting",style: TextStyle( ),))),]);
  }
}