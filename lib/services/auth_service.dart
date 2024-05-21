import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  // register
  //login
  // logout
  //alrady logined

  Future<DocumentSnapshot> loginUser(String email, String password) async {
    print(email);
    print(password);
    UserCredential userData = await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: email.trim().toString(),
            password:password);

    print(userData.user!.uid);

    final loginSnap = await FirebaseFirestore.instance
        .collection('login')
        .doc(userData!.user!.uid)
        .get();
    var token = await userData.user!.getIdToken();
    print(token);

    if (loginSnap['role'] == 'user') {
      final userSnap = await FirebaseFirestore.instance
          .collection('user')
          .doc(userData!.user!.uid)
          .get();
      SharedPreferences _pref = await SharedPreferences.getInstance();
      _pref.setString('token', token!);
      _pref.setString('name', userSnap['name']);
      _pref.setString('email', userSnap['email']);
      _pref.setString('phone', userSnap['phone']);

      _pref.setString('role', userSnap['role']);
    } else if (loginSnap['role'] == 'admin') {
      SharedPreferences _pref = await SharedPreferences.getInstance();
      _pref.setString('token', token!);
      _pref.setString('name', "admin");
      _pref.setString('email', email.toString());
      _pref.setString('phone', "9895663498");

      _pref.setString('role', loginSnap['role']);
    } else if (loginSnap['role'] == 'diagnostic') {
      print("I am Diagnostic officer");
      final userSnap = await FirebaseFirestore.instance
          .collection('diganosticLab')
          .doc(userData!.user!.uid)
          .get();
      SharedPreferences _pref = await SharedPreferences.getInstance();
      _pref.setString('token', token!);
      _pref.setString('name', userSnap['name']);
      _pref.setString('email', userSnap['email']);
      _pref.setString('phone', userSnap['phone']);
      _pref.setString('dept', userSnap['department']);
      _pref.setString('panchayath', userSnap['panchayath']);
      _pref.setString('qualification', userSnap['qualification']);

      _pref.setString('role', userSnap['role']);
    }
    // }else if (loginSnap['role'] == 'diagnostic') {
    //   print("I am Chief officer");
    //   final userSnap = await FirebaseFirestore.instance
    //       .collection('cheif')
    //       .doc(userData!.user!.uid)
    //       .get();
    //   SharedPreferences _pref = await SharedPreferences.getInstance();
    //   _pref.setString('token', token!);
    //   _pref.setString('name', userSnap['name']);
    //   _pref.setString('email', userSnap['email']);
    //   _pref.setString('phone', userSnap['phone']);
    //   _pref.setString('dept', userSnap['department']);
    //   _pref.setString('panchayath', userSnap['panchayath']);
    //   _pref.setString('qualification', userSnap['qualification']);
    //
    //   _pref.setString('role', userSnap['role']);

    else if (loginSnap['role'] == 'agriculture') {
      print("I am Agriculture officer");
      final userSnap = await FirebaseFirestore.instance
          .collection('agriculture')
          .doc(userData!.user!.uid)
          .get();
      SharedPreferences _pref = await SharedPreferences.getInstance();
      _pref.setString('token', token!);
      _pref.setString('name', userSnap['name']);
      _pref.setString('email', userSnap['email']);
      _pref.setString('phone', userSnap['phone']);
      _pref.setString('dept', userSnap['department']);
      _pref.setString('panchayath', userSnap['panchayath']);
      _pref.setString('qualification', userSnap['qualification']);

      _pref.setString('role', userSnap['role']);
    }else if (loginSnap['role'] == 'chief') {
      print("I am chief officer");
      final userSnap = await FirebaseFirestore.instance
          .collection('chief')
          .doc(userData!.user!.uid)
          .get();
      SharedPreferences _pref = await SharedPreferences.getInstance();
      _pref.setString('token', token!);
      _pref.setString('name', userSnap['name']);
      _pref.setString('email', userSnap['email']);
      _pref.setString('phone', userSnap['phone']);
      _pref.setString('dept', userSnap['department']);
      _pref.setString('panchayath', userSnap['panchayath']);
      _pref.setString('qualification', userSnap['qualification']);

      _pref.setString('role', userSnap['role']);
    }

    return loginSnap;
  }

  Future<void> logout() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.clear();

    await FirebaseAuth.instance.signOut();
  }

  Future<bool> isLoggedin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    String? _token = await pref.getString('token');

    // checking if there a token
    if (_token == null) {
      return false;
    } else {
      return true;
    }
  }
}
