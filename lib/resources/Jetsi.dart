import 'dart:math';
import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Jetsi {
  final User? user = FirebaseAuth.instance.currentUser;

  createMeeting({required roomname,required bool isAudioMuted,required bool isvideoOFF}) async {
    try {
      String meetingId = "meet_${Random().nextInt(100000)}";

      final JitsiMeet jitsiMeet = JitsiMeet();

      var options = JitsiMeetConferenceOptions(
        room: roomname,
        userInfo: JitsiMeetUserInfo(
          displayName: user?.displayName ?? "Guest",
          email: user?.email ?? "",
          
        ),
      
        configOverrides: {
          "startWithAudioMuted": isAudioMuted,
          "startWithVideoMuted": isvideoOFF,
        },
      );

      await jitsiMeet.join(options);
    } catch (e) {
      print("Error while creating meeting: $e");
    }
  }
}
