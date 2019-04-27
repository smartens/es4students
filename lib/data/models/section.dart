import 'package:es4students/data/models/module.dart';
import 'package:json_annotation/json_annotation.dart';
part 'section.g.dart';

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
