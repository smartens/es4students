import 'package:json_annotation/json_annotation.dart';
part 'content.g.dart';

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

  factory Content.fromJson(Map<String, dynamic> json) =>
      _$ContentFromJson(json);
  Map<String, dynamic> toJson() => _$ContentToJson(this);
}
