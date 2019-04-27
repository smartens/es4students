import 'package:es4students/data/models/content.dart';
import 'package:json_annotation/json_annotation.dart';
part 'module.g.dart';

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

enum Modname { FORUM, RESOURCE, FOLDER, URL, QUIZ, FEEDBACK }
enum Modplural { FOREN, DATEIEN, VERZEICHNISSE, LINKS_UR_LS, TESTS, FEEDBACKS }
