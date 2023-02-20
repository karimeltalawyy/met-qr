import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metqr/layout/Lecturer_layout/lecturer_layout_screen.dart';

import 'package:metqr/layout/cubit/cubit.dart';
import 'package:metqr/layout/cubit/states.dart';
import 'package:metqr/screens/student/student%20auth/login/login_screen.dart';
import 'package:metqr/shared/bloc_observer.dart';
import 'package:metqr/shared/styles/themes.dart';

import 'layout/student layout/stu_layout_screen.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppCubit()),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            themeMode: ThemeMode.light,
            home: const LecturerLayout(),
          );
        },
      ),
    );
  }
}


