import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:metqr/model/SessionSchudle.dart';
import 'package:metqr/model/Subject.dart';
import 'package:metqr/model/lecturer.dart';

import '../model/eventModel.dart';
import '../shared/component/constants/constants.dart';

class SessionProvider extends ChangeNotifier {
  //this is list of events passed to calender
  final List<Event> _events = [];
  Session? sessionModel;
  LecturerModel? lecturerModel;
  DateTime? fromDate = DateTime.now();
  DateTime? toDate = DateTime.now().add(const Duration(hours: 2));

  //create Session
  Future<Session?> createSession({
    required String lecturerId,
    required String lecturerName,
    List<Subject>? subject,
    List<String>? assignedStudentsIds,
    String? datesString,
    List<String>? dates,
    List<Attendance>? attendances,
    String? fromDate,
    String? toDate,
    String? fromTime,
    String? toTime,
    bool? isRepeated,
  }) async {
    try {
      final docSessions =
          FirebaseFirestore.instance.collection('sessions').doc();
      var sessionsModel = Session(
        fromDate: fromDate ?? DateTime.now().toIso8601String(),
        toDate: toDate ?? DateTime.now().toIso8601String(),
        fromTime: fromTime ?? DateTime.now().toIso8601String(),
        toTime: toTime ?? DateTime.now().toIso8601String(),
        isRepeated: isRepeated ?? true,
        subject: subject ?? <Subject>[],
        lecturerId: docSessions.id,
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

  Future<List<Lecture>> getLectures({
    required String lecturerId,
  }) async {
    final lecturerDocRef = FirebaseFirestore.instance
        .collection('sessions')
        .where('lecturerId', isEqualTo: lecturerId);
    final lecturerDoc = await lecturerDocRef.get();
    if (lecturerDoc == null && lecturerDoc.docs.isEmpty) return [];
    return lecturerDoc.docs
        .map((element) => Lecture.fromJson(element.data()))
        .toList();
  }

  Future<Lecture?> getCurrentLecture({required String lecturerId}) async {
    final lectureList = await getLectures(lecturerId: lecturerId);
    print(lectureList.length);
    if (lectureList.isEmpty) return null;

    return lectureList.first;
    final activeIndex = lectureList.indexWhere((element) =>
        element.lecDate != null
            ? DateTime.parse(element.lecDate!)
                .isAfter(DateTime.now().subtract(Duration(minutes: 60)))
            : false);

    if (activeIndex == -1) return null;
    return lectureList[activeIndex];
  }

//create subject
  Future<String?> createSubject({
    String? name,
    required String lecturerId,
    String? lecturerName,
    String? grade,
    String? devision,
  }) async {
    final subjectDocRef =
        FirebaseFirestore.instance.collection('sessions').doc(lecturerId);
    final subjectDoc = await subjectDocRef.get();

    final Session subjectModel =
        Session.fromJson(subjectDoc.data() as Map<String, dynamic>);

    subjectModel.subject ??= [];
    final id = '${lecturerId}_${subjectModel.subject!.length}';
    subjectModel.subject?.add(
      Subject(
        name: name ?? 'Database',
        lecturerId: lecturerId,
        lecturerName: lecturerName ?? 'Karim',
        grade: grade ?? '1',
        devision: devision ?? 'CS',
      ),
    );
    await subjectDocRef.update(subjectModel.toJson());
    return id;
  }
}
