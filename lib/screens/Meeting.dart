import "package:flutter/material.dart";
import "package:video_conference/resources/jetsi.dart";
import "package:video_conference/screens/JoinMeet.dart";
import "package:video_conference/widgets/homeButton.dart";

class Metting extends StatelessWidget {
  const Metting({super.key});

 
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
 Homebutton( onTap: () => Jetsi().createMeeting(isAudioMuted: true, isVideoOff: true),icon: Icons.videocam,text: "New Meeting"),
 Homebutton( onTap: ()=> Navigator.push(context, MaterialPageRoute(builder:(context)=>const Joinmeet())),icon: Icons.add_box_rounded,text: " Join Meeting" ),
     Homebutton( onTap: (){},icon: Icons.calendar_today,text: "Schdeule",),
    Homebutton( onTap: (){},icon: Icons.arrow_upward,text: "Share Screen",),
        
    
          ],
    
    
    ),Expanded(child: Center(child: Text("Create or Join Metting",style: TextStyle( ),))),]);
  }
}