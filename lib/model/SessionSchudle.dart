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
        required this.attendaces,
    });


    Subject subject;
    String lecturerId;
    String lecturerName;
    List<String> assignedStudentsIds;
    String datesString;
    List<String> dates;
    List<Attendace> attendaces;

    Session copyWith({
        Subject? subject,
        String? lecturerId,
        String? lecturerName,
        List<String>? assignedStudentsIds,
        String? datesString,
        List<String>? dates,
        List<Attendace>? attendaces,
    }) =>
        Session(
            subject: subject ?? this.subject,
            lecturerId: lecturerId ?? this.lecturerId,
            lecturerName: lecturerName ?? this.lecturerName,
            assignedStudentsIds: assignedStudentsIds ?? this.assignedStudentsIds,
            datesString: datesString ?? this.datesString,
            dates: dates ?? this.dates,
            attendaces: attendaces ?? this.attendaces,
        );

    factory Session.fromJson(Map<String, dynamic> json) => Session(
        subject: Subject.fromJson(json["subject"]),
        lecturerId: json["lecturerId"],
        lecturerName: json["lecturerName"],
        assignedStudentsIds: List<String>.from(json["assignedStudentsIds"].map((x) => x)),
        datesString: json["datesString"],
        dates: List<String>.from(json["dates"].map((x) => x)),
        attendaces: List<Attendace>.from(json["attendaces"].map((x) => Attendace.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "subject": subject.toJson(),
        "lecturerId": lecturerId,
        "lecturerName": lecturerName,
        "assignedStudentsIds": List<dynamic>.from(assignedStudentsIds.map((x) => x)),
        "datesString": datesString,
        "dates": List<dynamic>.from(dates.map((x) => x)),
        "attendaces": List<dynamic>.from(attendaces.map((x) => x.toJson())),
    };
}

class Attendace {
    Attendace({
        required this.date,
        required this.attendedStudents,
    });

    String date;
    List<String> attendedStudents;

    Attendace copyWith({
        String? date,
        List<String>? attendedStudents,
    }) =>
        Attendace(
            date: date ?? this.date,
            attendedStudents: attendedStudents ?? this.attendedStudents,
        );

    factory Attendace.fromJson(Map<String, dynamic> json) => Attendace(
        date: json["date"],
        attendedStudents: List<String>.from(json["attendedStudents"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "date": date,
        "attendedStudents": List<dynamic>.from(attendedStudents.map((x) => x)),
    };
}