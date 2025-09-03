import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Auth {
  final GoogleSignIn _googleSignIn = GoogleSignIn.standard();
final FirebaseAuth _auth = FirebaseAuth.instance;

Future<String> signInWithGoogle() async {
  String res = "Some error occurred";
  try {
    // Step 1: Start the Google sign-in process
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser == null) {
      return "Sign-in cancelled by user.";
      }

    // Step 2: Get authentication details
  
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    // Step 3: Create Firebase credential
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    
    // Step 4: Sign in to Firebase
    await _auth.signInWithCredential(credential);

      return "success";
  } on FirebaseAuthException catch (e) {
    res = e.message ?? "An unknown Firebase error occurred.";
  } catch (e) {
    res = e.toString();
  }
  return res;
}
User? get user => _auth.currentUser;
}