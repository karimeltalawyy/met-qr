import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:metqr/model/SessionSchudle.dart';
import 'package:metqr/model/Subject.dart';
import 'package:metqr/model/lecturer.dart';
import 'package:provider/provider.dart';

import '../model/eventModel.dart';
import '../shared/component/constants/constants.dart';
import '../shared/component/toast.dart';

class SessionProvider extends ChangeNotifier {
  //this is list of events passed to calender
  final List<Event> _events = [];
  Session? sessionModel;
  LecturerModel? lecturerModel;

  //create Session
  Future<Session?> createSession({
    required String lecturerId,
    required String lecturerName,
    List<Subject>? subject,
    List<String>? assignedStudentsIds,
    String? datesString,
    List<String>? dates,
    List<Attendance>? attendances,
  }) async {
    try {
      final docSessions =
          FirebaseFirestore.instance.collection('sessions').doc();
      var sessionsModel = Session(
        subject: subject ?? <Subject>[],
        lecturerId: docSessions.id ?? '2134',
        lecturerName: lecturerName,
        assignedStudentsIds: assignedStudentsIds ?? <String>[],
        datesString: datesString ?? '52345',
        dates: dates ?? <String>[],
        attendances: attendances ?? <Attendance>[],
      );
      await docSessions.set(sessionsModel.toJson());
      return sessionsModel;
    } catch (e) {
      debugPrint('error is >>>>>>$e');
      return null;
    }
  }

  Future<String?> createLecture({
    required String lecturerId,
    required String lectureId,
    required String name,
    required String lecturer,
    String? location,
    String? building,
    String? beginningOfLec,
    String? endOfLec,
    String? lecDate,
    String? image,
    required String totalStudents,
    String? lecTotalNum,
  }) async {
    final lectureDocRef =
        FirebaseFirestore.instance.collection('lectuerer').doc(lecturerId);
    final lectureDoc = await lectureDocRef.get();

    final LecturerModel model =
        LecturerModel.fromJson(lectureDoc.data() as Map<String, dynamic>);
    model.lectures ??= [];
    final id = '${lecturerId}_${model.lectures!.length}';
    model.lectures?.add(
      Lecture(
        name: name,
        lecturerId: lecturerId,
        lectureId: lectureId,
        lecturer: lecturer,
        totalStudents: totalStudents,
        location: location ?? 'D405',
        building: building ?? 'D',
        beginningOfLec: beginningOfLec ?? DateTime.now().toIso8601String(),
        endOfLec: endOfLec ?? DateTime.now().toIso8601String(),
        lecDate: lecDate ?? DateTime.now().toIso8601String(),
        image: image ?? networkImage,
        lecTotalNum: lecTotalNum ?? '12',
      ),
    );
    await lectureDocRef.update(model.toJson());
    return id;
  }

  Future<List<Lecture>> getLecture({
    required String lecturerId,
  }) async {
    final lecturerDocRef =
        FirebaseFirestore.instance.collection('lectuerer').doc(lecturerId);
    final lecturerDoc = await lecturerDocRef.get();
    final LecturerModel model =
        LecturerModel.fromJson(lecturerDoc.data() as Map<String, dynamic>);
    return model.lectures ?? [];
  }

  List<Event> get events => _events;

  DateTime _selectedDate =
      DateTime.now(); //hold the date on the last clicked one

  DateTime get selectedDate => _selectedDate;

  void setDate(DateTime date) => _selectedDate = date;

  List<Event> get eventsOfSelectedDate =>
      _events; // show the selected event date not all other date

  void addEvent(Event event) {
    _events.add(event);
    notifyListeners();
  }
}
