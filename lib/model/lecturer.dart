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
    lectures: List<Lecture>.from(json["lectures"].map((x) => Lecture.fromJson(x))),
    placeOfBirth: json["placeOfBirth"],
    gender: json["gender"],
  );

  Map<String, dynamic> toJson() => {
    "fullName": fullName,
    "email": email,
    "id": id,
    "phone": phone,
    "lectures": List<dynamic>.from(lectures!.map((x) => x.toJson())),
    "placeOfBirth": placeOfBirth,
    "gender": gender,
  };
}

class Lecture {
  Lecture({
    this.id,
    this.name,
    this.lecturer,
    this.location,
    this.building,
    this.beginingOfLec,
    this.endOfLec,
    this.lecDate,
    this.image,
    this.totalStudents,
    this.lecTotalNum,
  });

  String? id;
  String? name;
  String? lecturer;
  String? location;
  String? building;
  String? beginingOfLec;
  String? endOfLec;
  String? lecDate;
  String? image;
  String? totalStudents;
  String? lecTotalNum;

  Lecture copyWith({
    String? id,
    String? name,
    String? lecturer,
    String? location,
    String? building,
    String? beginingOfLec,
    String? endOfLec,
    String? lecDate,
    String? image,
    String? totalStudents,
    String? lecTotalNum,
  }) =>
      Lecture(
        id: id ?? this.id,
        name: name ?? this.name,
        lecturer: lecturer ?? this.lecturer,
        location: location ?? this.location,
        building: building ?? this.building,
        beginingOfLec: beginingOfLec ?? this.beginingOfLec,
        endOfLec: endOfLec ?? this.endOfLec,
        lecDate: lecDate ?? this.lecDate,
        image: image ?? this.image,
        totalStudents: totalStudents ?? this.totalStudents,
        lecTotalNum: lecTotalNum ?? this.lecTotalNum,
      );

  factory Lecture.fromJson(Map<String, dynamic> json) => Lecture(
    id: json["id"],
    name: json["name"],
    lecturer: json["lecturer"],
    location: json["location"],
    building: json["building"],
    beginingOfLec: json["beginingOfLec"],
    endOfLec: json["endOfLec"],
    lecDate: json["lecDate"],
    image: json["image"],
    totalStudents: json["totalStudents"],
    lecTotalNum: json["lecTotalNum"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "lecturer": lecturer,
    "location": location,
    "building": building,
    "beginingOfLec": beginingOfLec,
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