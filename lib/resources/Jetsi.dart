import 'dart:math';
import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:video_conference/resources/FirestoreHIstory.dart';

class Jetsi {
  final User? user = FirebaseAuth.instance.currentUser;
  final JitsiMeet jitsiMeet = JitsiMeet();
FirebaseAuth auth = FirebaseAuth.instance;
meeting meet=meeting();
  Future<void> createMeeting({
    required bool isAudioMuted,
    required bool isVideoOff,
  }) async {
    try {
      String room = "meet_${Random().nextInt(100000)}";
      await _joinRoom(room, isAudioMuted, isVideoOff);
    } catch (e) {
      print("Error while creating meeting: $e");
    }
  }

  Future<void> joinMeeting({
    required String roomname,
    required bool isAudioMuted,
    required bool isVideoOff,
  }) async {
    try {
      await _joinRoom(roomname, isAudioMuted, isVideoOff);
    } catch (e) {
      print("Error joining meeting: $e");
    }
  }
  Future<void> _joinRoom(
      String room, bool isAudioMuted, bool isVideoOff) async {
    var options = JitsiMeetConferenceOptions(
      room: room,
      userInfo: JitsiMeetUserInfo(
        displayName: user?.displayName ?? "Guest",
        email: user?.email ?? "",
      ),
      configOverrides: {
        "startWithAudioMuted": isAudioMuted,
        "startWithVideoMuted": isVideoOff,
      },
    );
   meet.addmeeting( room);
    await jitsiMeet.join(options);
  }
}
