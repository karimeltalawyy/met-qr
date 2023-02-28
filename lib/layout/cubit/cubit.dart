

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metqr/layout/cubit/states.dart';

import '../../screens/student/reports/reports_screen.dart';
import '../../screens/student/student home page/stu_homepage_screen.dart';
import '../../screens/student/student schedule/schedule_screen.dart';
import '../../screens/student/student settings/settings_screen.dart';



class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  // UserModel? userModel;

  int currentIndex = 0;
  List<Widget> screens = const [
    StudentHomePage(),
    ScheduleScreen(),
    ReportsScreen(),
    SettingsScreen(),
  ];

  void changeBottomNav(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavState());
  }


//   Future createStudent({
//     required String name,
//     required String id,
//     String? phone,
//     String? gender,
//     String? placeOfBirth,
//     String? email,
//     List<Lecture>? lectures,
//     List<Section>? section,
//   }) async {
//     final docStudent = FirebaseFirestore.instance.collection('students').doc();
//     final user = UserModel(
//       id: docStudent.id,
//       fullName: name,
//       phone: phone ?? '012133133',
//       gender: gender ?? 'male',
//       placeOfBirth: placeOfBirth ?? 'cairo',
//       email: email ?? 'examole@gmail.com',
//       lectures: [],
//       sections: [],
//     );
//     final json = user.toJson();
//     await docStudent.set(json).then((value) {
//       emit(METQCreateStudentSuccessState());
//     }).catchError((error) {
//       print(error.toString());
//       emit(METQCreateStudentErrorState(error.toString()));
//     });
//   }
//
//   Stream<List<UserModel>> readStudents() {
//     return FirebaseFirestore.instance.collection('students').snapshots().map(
//           (snapshot) => snapshot.docs
//               .map(
//                 (doc) => UserModel.fromJson(
//                   doc.data(),
//                 ),
//               )
//               .toList(),
//         );
//   }
}
