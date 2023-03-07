class LecturerModel {
  LecturerModel({
    this.fullName,
    this.email,
    this.id,
    this.phone,
    this.lectures,
    this.placeOfBirth,
    this.gender,
  });

  String? fullName;
  String? email;
  String? id;
  String? phone;
  List<Lecture>? lectures;
  String? placeOfBirth;
  String? gender;

  LecturerModel copyWith({
    String? fullName,
    String? email,
    String? id,
    String? phone,
    List<Lecture>? lectures,
    String? placeOfBirth,
    String? gender,
  }) =>
      LecturerModel(
        fullName: fullName ?? this.fullName,
        email: email ?? this.email,
        id: id ?? this.id,
        phone: phone ?? this.phone,
        lectures: lectures ?? this.lectures,
        placeOfBirth: placeOfBirth ?? this.placeOfBirth,
        gender: gender ?? this.gender,
      );

  factory LecturerModel.fromJson(Map<String, dynamic> json) => LecturerModel(
        fullName: json["fullName"],
        email: json["email"],
        id: json["id"],
        phone: json["phone"],
        lectures: json["lectures"] != null && json["lectures"] is List
            ? List<Lecture>.from(
                json["lectures"].map<Lecture>((x) => Lecture.fromJson(x)))
            : [],
        placeOfBirth: json["placeOfBirth"],
        gender: json["gender"],
      );

  Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "email": email,
        "id": id,
        "phone": phone,
        "lectures": lectures != null
            ? List<dynamic>.from(lectures!.map((x) => x.toJson()))
            : [],
        "placeOfBirth": placeOfBirth,
        "gender": gender,
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
    "lecturerId": lecturerId,
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
