import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:metqr/layout/Lecturer_layout/lecturer_layout_screen.dart';
import 'package:metqr/model/lecturer.dart';
import 'package:metqr/providers/auth_provider.dart';
import 'package:provider/provider.dart';

import '../screens/Lecturer/login/lecturer_login_screen.dart';


class LecturerWrapper extends HookWidget {
  const LecturerWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    return StreamBuilder<LecturerModel?>(
        stream: authProvider.lecturerModelStream,
        builder: (_, AsyncSnapshot<LecturerModel?> snapshot) {
          if (snapshot.data == null) {
            return snapshot.connectionState == ConnectionState.active
                ? LecturerLoginScreen()
                : const Scaffold(
                    body: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
          } else {
            return LecturerLayout();
          }
        });
  }
}
