// https://flutter.dev/docs/development/data-and-backend/json#generating-code-continuously

import 'package:json_annotation/json_annotation.dart';

part 'models.g.dart';

@JsonSerializable()
class User {
  int userid;
  String username;
  String firstname;
  String lastname;
  String fullname;
  String lang;
  String userpictureurl;

  User(this.userid, this.username, this.firstname, this.lastname, this.fullname,
      this.lang, this.userpictureurl);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

class AllCourses {
  List<Course> course;

  AllCourses({
    this.course
});

  factory AllCourses.fromJson(List<dynamic> parsedJson) {

    List<Course> course = new List<Course>();
    course = parsedJson.map((i)=>Course.fromJson(i)).toList();

    return new AllCourses(
      course: course
    );
  }
}

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

@JsonSerializable()
class Section {
  int id;
  String name;
  int visible;
  String summary;
  int summaryformat;
  int section;
  int hiddenbynumsections;
  bool uservisible;
  List<Module> modules;

  Section(
    this.id,
    this.name,
    this.visible,
    this.summary,
    this.summaryformat,
    this.section,
    this.hiddenbynumsections,
    this.uservisible,
    this.modules,
  );

  factory Section.fromJson(Map<String, dynamic> json) =>
      _$SectionFromJson(json);
  Map<String, dynamic> toJson() => _$SectionToJson(this);
}

@JsonSerializable()
class Module {
  int id;
  String url;
  String name;
  int instance;
  int visible;
  bool uservisible;
  int visibleoncoursepage;
  String modicon;
  Modname modname;
  Modplural modplural;
  int indent;
  List<Content> contents;
  String description;
  String availabilityinfo;

  Module({
    this.id,
    this.url,
    this.name,
    this.instance,
    this.visible,
    this.uservisible,
    this.visibleoncoursepage,
    this.modicon,
    this.modname,
    this.modplural,
    this.indent,
    this.contents,
    this.description,
    this.availabilityinfo,
  });

  factory Module.fromJson(Map<String, dynamic> json) => _$ModuleFromJson(json);
  Map<String, dynamic> toJson() => _$ModuleToJson(this);
}

@JsonSerializable()
class Content {
  String type;
  String filename;
  String filepath;
  int filesize;
  String fileurl;
  int timecreated;
  int timemodified;
  int sortorder;
  String mimetype;
  bool isexternalfile;
  int userid;
  String author;
  String license;

  Content({
    this.type,
    this.filename,
    this.filepath,
    this.filesize,
    this.fileurl,
    this.timecreated,
    this.timemodified,
    this.sortorder,
    this.mimetype,
    this.isexternalfile,
    this.userid,
    this.author,
    this.license,
  });

  factory Content.fromJson(Map<String, dynamic> json) => _$ContentFromJson(json);
  Map<String, dynamic> toJson() => _$ContentToJson(this);
}

enum Modname { FORUM, RESOURCE, FOLDER, URL, QUIZ, FEEDBACK }

enum Modplural { FOREN, DATEIEN, VERZEICHNISSE, LINKS_UR_LS, TESTS, FEEDBACKS }
