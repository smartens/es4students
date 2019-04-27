import 'package:json_annotation/json_annotation.dart';
part 'course.g.dart';

@JsonSerializable()
class Course {
  int id;
  String shortname;
  String fullname;
  int enrolledusercount;
  String idnumber;
  int visible;
  String summary;
  int summaryformat;
  String format;
  bool showgrades;
  String lang;
  bool enablecompletion;
  int category;
  int progress;
  int startdate;
  int enddate;

  Course({
    this.id,
    this.shortname,
    this.fullname,
    this.enrolledusercount,
    this.idnumber,
    this.visible,
    this.summary,
    this.summaryformat,
    this.format,
    this.showgrades,
    this.lang,
    this.enablecompletion,
    this.category,
    this.progress,
    this.startdate,
    this.enddate,
  });

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);
  Map<String, dynamic> toJson() => _$CourseToJson(this);
}
