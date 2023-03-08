// To parse this JSON data, do
//
//     final subject = subjectFromJson(jsonString);

import 'dart:convert';

Subject subjectFromJson(String str) => Subject.fromJson(json.decode(str));

String subjectToJson(Subject data) => json.encode(data.toJson());

class Subject {
  Subject({
    required this.name,
    required this.lecturerId,
    required this.lecturerName,
    required this.grade,
    required this.devision,
  });

  String name;
  String lecturerId;
  String lecturerName;
  String grade;
  String devision;

  Subject copyWith({
    String? name,
    String? lecturerId,
    String? lecturerName,
    String? grade,
    String? devision,
  }) =>
      Subject(
        name: name ?? this.name,
        lecturerId: lecturerId ?? this.lecturerId,
        lecturerName: lecturerName ?? this.lecturerName,
        grade: grade ?? this.grade,
        devision: devision ?? this.devision,
      );

  factory Subject.fromJson(Map<String, dynamic> json) => Subject(
    name: json["name"],
    lecturerId: json["lecturerId"],
    lecturerName: json["lecturerName"],
    grade: json["grade"],
    devision: json["devision"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "lecturerId": lecturerId,
    "lecturerName": lecturerName,
    "grade": grade,
    "devision": devision,
  };
}
