import 'dart:convert';

import 'package:metqr/model/Subject.dart';

Session sessionFromJson(String str) => Session.fromJson(json.decode(str));

String sessionToJson(Session data) => json.encode(data.toJson());

class Session {
  Session({
    required this.subject,
    required this.lecturerId,
    required this.lecturerName,
    required this.assignedStudentsIds,
    required this.datesString,
    required this.dates,
    required this.attendances,
  });

  List<Subject>? subject;
  String lecturerId;
  String lecturerName;
  List<String> assignedStudentsIds;
  String datesString;
  List<String> dates;
  List<Attendance> attendances;

  Session copyWith({
    List<Subject>? subject,
    String? lecturerId,
    String? lecturerName,
    List<String>? assignedStudentsIds,
    String? datesString,
    List<String>? dates,
    List<Attendance>? attendances,
  }) =>
      Session(
        subject: subject ?? this.subject,
        lecturerId: lecturerId ?? this.lecturerId,
        lecturerName: lecturerName ?? this.lecturerName,
        assignedStudentsIds: assignedStudentsIds ?? this.assignedStudentsIds,
        datesString: datesString ?? this.datesString,
        dates: dates ?? this.dates,
        attendances: attendances ?? this.attendances,
      );

  factory Session.fromJson(Map<String, dynamic> json) => Session(
        subject: json['subject'] != null
            ? List<Subject>.from(
                json["subject"].map((x) => Subject.fromJson(x)))
            : [],
        lecturerId: json["lecturerId"],
        lecturerName: json["lecturerName"],
        assignedStudentsIds:
            List<String>.from(json["assignedStudentsIds"].map((x) => x)),
        datesString: json["datesString"],
        dates: List<String>.from(json["dates"].map((x) => x)),
        attendances: json['attendances'] != null
            ? List<Attendance>.from(
                json["attendances"].map((x) => Attendance.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "subject": List<dynamic>.from(subject!.map((x) => x.toJson())),
        "lecturerId": lecturerId,
        "lecturerName": lecturerName,
        "assignedStudentsIds":
            List<dynamic>.from(assignedStudentsIds.map((x) => x)),
        "datesString": datesString,
        "dates": List<dynamic>.from(dates.map((x) => x)),
        "attendances": List<dynamic>.from(attendances.map((x) => x.toJson())),
      };
}

class Attendance {
  Attendance({
    required this.date,
    required this.attendedStudents,
  });

  String date;
  List<String> attendedStudents;

  Attendance copyWith({
    String? date,
    List<String>? attendedStudents,
  }) =>
      Attendance(
        date: date ?? this.date,
        attendedStudents: attendedStudents ?? this.attendedStudents,
      );

  factory Attendance.fromJson(Map<String, dynamic> json) => Attendance(
        date: json["date"],
        attendedStudents:
            List<String>.from(json["attendedStudents"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "attendedStudents": List<dynamic>.from(attendedStudents.map((x) => x)),
      };
}
