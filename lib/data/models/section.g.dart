// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'section.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Section _$SectionFromJson(Map<String, dynamic> json) {
  return Section(
      json['id'] as int,
      json['name'] as String,
      json['visible'] as int,
      json['summary'] as String,
      json['summaryformat'] as int,
      json['section'] as int,
      json['hiddenbynumsections'] as int,
      json['uservisible'] as bool,
      (json['modules'] as List)
          ?.map((e) =>
              e == null ? null : Module.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$SectionToJson(Section instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'visible': instance.visible,
      'summary': instance.summary,
      'summaryformat': instance.summaryformat,
      'section': instance.section,
      'hiddenbynumsections': instance.hiddenbynumsections,
      'uservisible': instance.uservisible,
      'modules': instance.modules
    };
