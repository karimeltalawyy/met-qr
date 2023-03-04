import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:metqr/model/lecturer.dart';
import 'package:metqr/shared/component/toast.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  LecturerModel? lecturerModel;
  late final Stream<LecturerModel?> lecturerModelStream;

  AuthProvider() {
    lecturerModelStream =
        _firebaseAuth.authStateChanges().map<LecturerModel?>((event) {
      final _lecturerModel = _lecturerModelFromFirebase(event);
      FirebaseFirestore.instance
          .collection('lectuerer')
          .doc(event?.uid)
          .get()
          .then((value) {
        if (value.exists && value.data() != null) {
          lecturerModel = LecturerModel.fromJson(value.data()!);
          notifyListeners();
        }
      });
      return _lecturerModel;
    });
  }

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
        .collection('lectuerer')
        .doc(credential?.uid)
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

  Future createUser({
    required String fullName,
    required String email,
    String? phone,
    required String id,
    String? image,
  }) async {
    final lecturerDoc = FirebaseFirestore.instance.collection('lectuerer').doc(id);

    final lecturer = LecturerModel(
      fullName: fullName,
      email: email,
      id: lecturerDoc.id,
      phone: phone,
    );
    lecturerDoc.set(lecturer.toJson());
  }

  Future<LecturerModel?> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
    required String phone,
    String? image,
  }) async {
    try {
      final UserCredential credential =
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user != null) {
        await createUser(
          email: email,
          id: credential.user!.uid,
          fullName: name,
          phone: phone,
        );
        await _firebaseAuth.currentUser?.updateDisplayName(name);
      }
      return _lecturerModelFromFirebase(credential.user);
    } on FirebaseAuthException catch (error) {
      showToast(message: error.message!, state: ToastStates.ERROR);
      debugPrint('error is >>>>>> $error');
    }
    return null;
  }

  Future<void> signOut() async {
    lecturerModel == null;
    notifyListeners();
    return await _firebaseAuth.signOut();
  }
}
