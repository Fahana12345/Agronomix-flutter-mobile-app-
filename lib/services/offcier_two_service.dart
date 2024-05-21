import 'package:agronomix/models/agri_offcier_modl.dart';
import 'package:agronomix/models/cheif_officer_model.dart';
import 'package:agronomix/models/diagnostic_officer_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class OfficerTwoService{



// Sign Up
  Future<bool?> signUp(OfficerTwoModel user) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: user.email!,
        password: user.password!,
      );


      final usermodel=OfficerThreeModel(
          role: user.role,

          email:user.email,
          uid: userCredential.user!.uid,
          password:user.password,
          name: user.name,
          phone: user.phone,
          status: user.status,
          department: user.department,
          qualification: user.qualification,
          panchayath: user.panchayath,
          dateOfBirth: user.dateOfBirth,
          createdAt: user.createdAt

      );



      FirebaseFirestore.instance
          .collection('login')
          .doc(userCredential.user!.uid)
          .set({

        'uid':usermodel.uid,
        'role':usermodel.role,
        'email':usermodel.email
      });
      // After successful sign-up, store additional user data in Firestore
      await FirebaseFirestore.instance.collection('agriculture').doc(userCredential.user!.uid).set(usermodel.toMap());
      return true;
    } catch (e) {
      print("Failed to sign up: $e");
      throw e; // Rethrow the error for handling in UI
    }
  }

// Sign In
  Future<void> signIn(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      print("Failed to sign in: $e");
      throw e; // Rethrow the error for handling in UI
    }
  }

  Future<List<OfficerTwoModel>> viewAllOfficers() async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance.collection('agriculture').get();
      List<OfficerTwoModel> officers = snapshot.docs.map((doc) => OfficerTwoModel.fromMap(doc.data())).toList();
      return officers;
    } catch (e) {
      print("Failed to fetch all officers: $e");
      throw e; // Rethrow the error for handling in UI
    }
  }

// Fetch User Profile
// Future<OfficerOneModel?> fetchUserProfile(String uid) async {
//   try {
//     DocumentSnapshot<Map<String, dynamic>> snapshot =
//     await FirebaseFirestore.instance.collection('users').doc(uid).get();
//     if (snapshot.exists) {
//       return OfficerOneModel.fromMap(snapshot.data());
//     } else {
//       return null; // User not found
//     }
//   } catch (e) {
//     print("Failed to fetch user profile: $e");
//     throw e; // Rethrow the error for handling in UI
//   }
// }

}