import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:keepnotes/model/notes_model.dart';
import 'package:keepnotes/view/home_screen.dart';
import 'package:keepnotes/view/login_screen.dart';

class AuthService {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<String?> signupAuth(
    String email,
    String password,
    BuildContext context,
  ) async {
    UserCredential credential = await firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);

    User? user = credential.user;

    if (user != null) {
      ModelKeepNotes usermodels = ModelKeepNotes(
        email: email,
        uId: user.uid,
      );
      await firestore
          .collection('users')
          .doc(user.uid)
          .set(usermodels.toJson());

      log('signup success');
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ));
      return null;
    }
  }

  Future<User?> loginAuth(
      String email, String password, BuildContext context) async {
    UserCredential credential = await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);

    if (firebaseAuth.currentUser!.emailVerified) {
      return credential.user;
    }
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const HomeScreen(),
    ));
  }

  Future<void> logoutAuth(BuildContext context) async {
    await firebaseAuth.signOut();
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => LoginScreen(),
    ));
    log('loged out');
  }

  Future<UserCredential?> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        return null;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential =
          await firebaseAuth.signInWithCredential(credential);
      User? user = userCredential.user;

      if (user != null) {
        DocumentReference userDoc = firestore.collection('users').doc(user.uid);
        DocumentSnapshot docSnapshot = await userDoc.get();

        if (!docSnapshot.exists) {
          ModelKeepNotes newUser = ModelKeepNotes(
            email: user.email,
            uId: user.uid,
          );

          await userDoc.set(newUser.toJson());
        }
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );

        return userCredential;
      }

      print('User Name: ${googleUser.displayName}');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error signing in with Google: $e')),
      );
      print('Error signing in with Google: $e');
      return null;
    }
  }
// Future<void> signInWithPhone(String phone, BuildContext context) async {
//     firebaseAuth.verifyPhoneNumber(
//       phoneNumber: phone,
//       verificationCompleted: (PhoneAuthCredential credential) async {
//         await firebaseAuth.signInWithCredential(credential);
//         Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
//       },
//       verificationFailed: (FirebaseAuthException e) {
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message.toString())));
//       },
//       codeSent: (String verificationId, int? resendToken) {
//         Navigator.of(context).push(
//           MaterialPageRoute(
//             builder: (context) => OTPScreen(verificationId: verificationId),
//           ),
//         );
//       },
//       codeAutoRetrievalTimeout: (String verificationId) {},
//     );
//   }

//   Future<void> verifyOTP(String verificationId, String smsCode, BuildContext context) async {
//     try {
//       PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);
//       await firebaseAuth.signInWithCredential(credential);
//       Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
//     }
//   }
}
