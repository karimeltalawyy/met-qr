import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:metqr/layout/Lecturer_layout/lecturer_layout_screen.dart';
import 'package:metqr/layout/student%20layout/stu_layout_screen.dart';
import 'package:metqr/model/lecturer.dart';
import 'package:metqr/model/user.dart';
import 'package:metqr/providers/auth_provider.dart';
import 'package:metqr/providers/student_auth_provider.dart';
import 'package:metqr/screens/student/login/student_login_screen.dart';
import 'package:provider/provider.dart';

import '../screens/Lecturer/login/lecturer_login_screen.dart';


class StudentWrapper extends HookWidget {
  const StudentWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<StudentAuthProvider>(context, listen: false);
    return StreamBuilder<UserModel?>(
        stream: authProvider.studentModelStream,
        builder: (_, AsyncSnapshot<UserModel?> snapshot) {
          if (snapshot.data == null) {
            return snapshot.connectionState == ConnectionState.active
                ? const StudentLoginScreen()
                : const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            return const StudentLayoutPage();
          }
        });
  }
}
