import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:metqr/model/lecturer.dart';

import '../shared/component/toast.dart';

class AuthProvider {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  AuthProvider() {}

  LecturerModel? _lecturerModelFromFirebase(User? user) {
    if (user == null) {
      return null;
    }
    return LecturerModel(
      id: user.uid,
      email: user.email,
      fullName: user.displayName,
      phone: user.phoneNumber,
    );
  }

  Future<LecturerModel?> lecturerData() async {
    final credential = FirebaseAuth.instance.currentUser;
    return await FirebaseFirestore.instance
        .collection('lecturer')
        .doc()
        .get()
        .then((value) {
          return null;
    });
  }
  Future<LecturerModel?> signInWithEmailAndPassword({
    required String? email,
    required String? password,
  }) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email!.trim(),
        password: password!.trim(),
      );
      return _lecturerModelFromFirebase(credential.user);
    } on FirebaseAuthException catch (error) {
      debugPrint(error.toString());
      showToast(
        message: error.message!,
        state: ToastStates.ERROR,
      );
    }
    return null;
  }
}
