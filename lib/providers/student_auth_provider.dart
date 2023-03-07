import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:metqr/model/user.dart';
import 'package:metqr/shared/component/toast.dart';

class StudentAuthProvider extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  UserModel? studentModel;
  late final Stream<UserModel?> studentModelStream;

  StudentAuthProvider() {
    studentModelStream =
        _firebaseAuth.authStateChanges().map<UserModel?>((event) {
      final _studentModel = _studentModelFromFirebase(event);
      FirebaseFirestore.instance
          .collection('users')
          .doc(event?.uid)
          .get()
          .then((value) {
        if (value.exists && value.data() != null) {
          studentModel = UserModel.fromJson(value.data()!);
          notifyListeners();
        }
      });
      return _studentModel;
    });
  }

  UserModel? _studentModelFromFirebase(User? user) {
    if (user == null) {
      return null;
    }
    return UserModel(
      id: user.uid,
      email: user.email,
      fullName: user.displayName,
    );
  }

  Future<UserModel?> studentData() async {
    final credential = FirebaseAuth.instance.currentUser;
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(credential?.uid)
        .get()
        .then((value) {
      return null;
    });
  }

  Future<UserModel?> signInWithEmailAndPassword({
    required String? email,
    required String? password,
  }) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email!.trim(),
        password: password!.trim(),
      );
      return _studentModelFromFirebase(credential.user);
    } on FirebaseAuthException catch (error) {
      debugPrint(error.toString());
      showToast(
        message: error.message!,
        state: ToastStates.ERROR,
      );
    }
    return null;
  }

  Future<UserModel?> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String fullName,
    required String phone,
    required String universityCode,
    String? image,
  }) async {
    try {
      final UserCredential credential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user != null) {
        await createStudent(
          phone: phone ?? '01232323',
          fullName: fullName,
          email: email,
          image: image ?? '',
          universityCode: universityCode,
          id: credential.user!.uid,
        );
        await _firebaseAuth.currentUser?.updateDisplayName(fullName);
      }
      return _studentModelFromFirebase(credential.user);
    } on FirebaseAuthException catch (error) {
      showToast(message: error.message!, state: ToastStates.ERROR);
      debugPrint('error is >>>>>> $error');
    }
    return null;
  }

  Future createStudent({
    required String fullName,
    required String email,
    String? phone,
    required String universityCode,
    required String id,
    String? image,
    String? gender,
    List<Lecture>? lectures,
    String? placeOfBirth,
  }) async {
    final studentDoc = FirebaseFirestore.instance.collection('users').doc(id);

    final student = UserModel(
      id: studentDoc.id,
      fullName: fullName,
      email: email,
      phone: phone,
      gender: gender ?? 'Male',
      lectures: lectures ?? <Lecture>[],
      placeOfBirth: placeOfBirth ?? '',
      universityCode: universityCode ?? '1235467',
    );
    studentDoc.set(student.toJson());
  }

  Future<void> signOut() async {
    studentModel == null;
    notifyListeners();
    return await _firebaseAuth.signOut();
  }
}
