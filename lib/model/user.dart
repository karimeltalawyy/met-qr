class UserModel {
  UserModel({
    this.fullName,
    this.email,
    this.id,
    this.phone,
    this.lectures,
    this.placeOfBirth,
    this.gender,
    this.sections,
    this.universityCode,
  });

  String? fullName;
  String? email;
  String? id;
  String? phone;
  List<Lecture>? lectures;
  String? placeOfBirth;
  String? gender;
  String? universityCode;
  List<Section>? sections;

  UserModel copyWith({
    String? fullName,
    String? email,
    String? id,
    String? phone,
    List<Lecture>? lectures,
    String? placeOfBirth,
    String? gender,
    List<Section>? sections,
    String? universityCode,
  }) =>
      UserModel(
        fullName: fullName ?? this.fullName,
        email: email ?? this.email,
        id: id ?? this.id,
        phone: phone ?? this.phone,
        lectures: lectures ?? this.lectures,
        placeOfBirth: placeOfBirth ?? this.placeOfBirth,
        gender: gender ?? this.gender,
        sections: sections ?? this.sections,
        universityCode: universityCode ?? this.universityCode,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        fullName: json["fullName"],
        universityCode: json["universityCode"],
        email: json["email"],
        id: json["id"],
        phone: json["phone"],
        lectures: List<Lecture>.from(
            json["lectures"].map((x) => Lecture.fromJson(x))),
        placeOfBirth: json["placeOfBirth"],
        gender: json["gender"],
        sections: List<Section>.from(
            json["sections"].map((x) => Section.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "email": email,
        "universityCode": universityCode,
        "id": id,
        "phone": phone,
        "lectures": lectures != null
            ? List<dynamic>.from(lectures!.map((x) => x.toJson()))
            : [],
        "placeOfBirth": placeOfBirth,
        "gender": gender,
        "sections": sections != null
            ? List<dynamic>.from(sections!.map((x) => x.toJson()))
            : [],
      };
}

class Lecture {
  Lecture({
    this.lectureId,
    this.lecturerId,
    this.name,
    this.lecturer,
    this.location,
    this.building,
    this.beginningOfLec,
    this.endOfLec,
    this.lecDate,
    this.image,
    this.totalStudents,
    this.lecTotalNum,
  });

  String? lectureId;
  String? lecturerId;
  String? name;
  String? lecturer;
  String? location;
  String? building;
  String? beginningOfLec;
  String? endOfLec;
  String? lecDate;
  String? image;
  String? totalStudents;
  String? lecTotalNum;

  Lecture copyWith({
    String? lectureId,
    String? lecturerId,
    String? name,
    String? lecturer,
    String? location,
    String? building,
    String? beginningOfLec,
    String? endOfLec,
    String? lecDate,
    String? image,
    String? totalStudents,
    String? lecTotalNum,
  }) =>
      Lecture(
        lectureId: lectureId ?? this.lectureId,
        lecturerId: lecturerId ?? this.lecturerId,
        name: name ?? this.name,
        lecturer: lecturer ?? this.lecturer,
        location: location ?? this.location,
        building: building ?? this.building,
        beginningOfLec: beginningOfLec ?? this.beginningOfLec,
        endOfLec: endOfLec ?? this.endOfLec,
        lecDate: lecDate ?? this.lecDate,
        image: image ?? this.image,
        totalStudents: totalStudents ?? this.totalStudents,
        lecTotalNum: lecTotalNum ?? this.lecTotalNum,
      );

  factory Lecture.fromJson(Map<String, dynamic> json) => Lecture(
        lectureId: json["lectureId"],
        lecturerId: json["lecturerId"],
        name: json["name"],
        lecturer: json["lecturer"],
        location: json["location"],
        building: json["building"],
        beginningOfLec: json["beginningOfLec"],
        endOfLec: json["endOfLec"],
        lecDate: json["lecDate"],
        image: json["image"],
        totalStudents: json["totalStudents"],
        lecTotalNum: json["lecTotalNum"],
      );

  Map<String, dynamic> toJson() => {
        "lectureId": lectureId,
        "name": name,
        "lecturer": lecturer,
        "location": location,
        "building": building,
        "beginningOfLec": beginningOfLec,
        "endOfLec": endOfLec,
        "lecDate": lecDate,
        "image": image,
        "totalStudents": totalStudents,
        "lecTotalNum": lecTotalNum,
      };
}

class Section {
  Section({
    this.id,
    this.name,
    this.lecturer,
  });

  String? id;
  String? name;
  List<String>? lecturer;

  Section copyWith({
    String? id,
    String? name,
    List<String>? lecturer,
  }) =>
      Section(
        id: id ?? this.id,
        name: name ?? this.name,
        lecturer: lecturer ?? this.lecturer,
      );

  factory Section.fromJson(Map<String, dynamic> json) => Section(
        id: json["id"],
        name: json["name"],
        lecturer: List<String>.from(json["lecturer"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "lecturer": List<dynamic>.from(lecturer!.map((x) => x)),
      };
}
