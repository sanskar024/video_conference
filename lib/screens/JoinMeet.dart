import 'package:flutter/material.dart';
import 'package:video_conference/utils/color.dart';
import 'package:video_conference/resources/auth.dart';
import 'package:video_conference/widgets/button.dart';
import 'package:video_conference/resources/Jetsi.dart';
class Joinmeet extends StatefulWidget {
  const Joinmeet({super.key});

  @override
  State<Joinmeet> createState() => _JoinmeetState();
}

class _JoinmeetState extends State<Joinmeet> {
  late TextEditingController roomController;
  late TextEditingController nameController;
  Jetsi meet=Jetsi();
  bool isAudioMuted=true;
 bool isVideoMuted=true;  
  final Auth _authMethods = Auth();
  @override
  void initState() {
    roomController=TextEditingController();
    nameController=TextEditingController(text: _authMethods.user?.displayName);
    super.initState();
    
  } 
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(
        backgroundColor: backgroundColor,
        elevation: 0, 
        centerTitle: true,
        title: const Text("Join Meeting"),
      ),
      body:Column(  
        children: [
          TextField(
            controller: roomController,
            maxLines: 1,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number, 
            decoration: const InputDecoration(
              fillColor: secondaryBackgroundColor,
              filled: true,
              border: InputBorder.none,
              hintText: "Room ID",  ),
          ),
          const SizedBox(height: 20,),  
          TextField(
            controller: nameController,
            maxLines: 1,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.name, 
            decoration: const InputDecoration(
              fillColor: secondaryBackgroundColor,
              filled: true,
              border: InputBorder.none,
              hintText: "Name",  ),
          ),
          Container(width:200,child: Button(data:"join", onPressed:() => _joinMeeting(isAudioMuted, isVideoMuted) )),
          const SizedBox(height: 20),
          Container( 
            height: 60,
           color:secondaryBackgroundColor,
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[
               const Padding(
                 padding: EdgeInsets.all(8.0),
                 child: Text("Mute Audio",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),textAlign: TextAlign.center),
               ),
                Switch.adaptive(value: isAudioMuted, onChanged:  (value) {
                    setState(() {
                      isAudioMuted = value;
                    });
                  },)
              ]
            ),
          ),
          Container(
            height: 60,
           color:secondaryBackgroundColor,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                 const Text("Turn Off Video",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                 Switch.adaptive (value: isVideoMuted,  onChanged: (value) {
                      setState(() {
                        isVideoMuted = value;
                      });
                    }, )
                ]
              ),
            ),
          ),

          

        ],
      
      )
    );
  }
   _joinMeeting(bool isAudioMuted, bool isVideoMuted) {
          meet.joinMeeting(isAudioMuted:isAudioMuted,isVideoOff: isVideoMuted,roomname: roomController.text.trim() );
  }
}
