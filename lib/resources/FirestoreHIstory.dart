import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class meeting{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Stream get meet=> _firestore.collection("users").doc(_auth.currentUser!.uid).collection("meetings").snapshots();
  void addmeeting(String name){
    try{
         _firestore.collection("users").doc(_auth.currentUser!.uid).collection("meetings").add({
          "name": name,
  "created_at": Timestamp.now(),
  "host": _auth.currentUser!.email??"unkown",
         });
    }
    catch(e){
      print(e);
    
    }
  }
 Future<void> deleteMeeting(String meetingId) async {
    try {
      await _firestore
          .collection("users")
          .doc(_auth.currentUser!.uid)
          .collection("meetings")
          .doc(meetingId)
          .delete();
      print("Meeting deleted successfully");
    } catch (e) {
      print("Error deleting meeting: $e");
    }
  }
}