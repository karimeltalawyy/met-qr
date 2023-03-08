import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:metqr/providers/auth_provider.dart';
import 'package:metqr/providers/session_provider.dart';
import 'package:metqr/providers/lecturer_wrapper.dart';
import 'package:metqr/providers/student_auth_provider.dart';
import 'package:metqr/providers/student_wrapper.dart';
import 'package:metqr/shared/bloc_observer.dart';
import 'package:metqr/shared/styles/themes.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'firebase_options.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (_) => AuthProvider(),
        ),
        ChangeNotifierProvider<StudentAuthProvider>(
          create: (_) => StudentAuthProvider(),
        ),
        ChangeNotifierProvider<SessionProvider>(
          create: (_) => SessionProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        themeMode: ThemeMode.light,
        home: ScreenTypeLayout(
          desktop: const LecturerWrapper(),
          mobile: const StudentWrapper(),
        ),
      ),
    );
  }
}
