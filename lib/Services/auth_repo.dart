import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:metqr/Services/auth_service.dart';
import 'package:metqr/shared/component/toast.dart';

class AuthRepository extends BaseAuthLecturer {
  final FirebaseAuth _firebaseAuth;

  AuthRepository({FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  @override
  Future<User?> signUp(
      {required String email, required String password}) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = credential.user;
      return user;
    } catch (error) {
      showToast(
        message: 'Some thing wont wrong',
        state: ToastStates.ERROR,
      );
    }
  }

 //if things about user changes
  @override
  Stream<User?> get user => _firebaseAuth.userChanges();
}
