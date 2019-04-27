// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'module.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Module _$ModuleFromJson(Map<String, dynamic> json) {
  return Module(
      id: json['id'] as int,
      url: json['url'] as String,
      name: json['name'] as String,
      instance: json['instance'] as int,
      visible: json['visible'] as int,
      uservisible: json['uservisible'] as bool,
      visibleoncoursepage: json['visibleoncoursepage'] as int,
      modicon: json['modicon'] as String,
      modname: _$enumDecodeNullable(_$ModnameEnumMap, json['modname']),
      modplural: _$enumDecodeNullable(_$ModpluralEnumMap, json['modplural']),
      indent: json['indent'] as int,
      contents: (json['contents'] as List)
          ?.map((e) =>
              e == null ? null : Content.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      description: json['description'] as String,
      availabilityinfo: json['availabilityinfo'] as String);
}

Map<String, dynamic> _$ModuleToJson(Module instance) => <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'name': instance.name,
      'instance': instance.instance,
      'visible': instance.visible,
      'uservisible': instance.uservisible,
      'visibleoncoursepage': instance.visibleoncoursepage,
      'modicon': instance.modicon,
      'modname': _$ModnameEnumMap[instance.modname],
      'modplural': _$ModpluralEnumMap[instance.modplural],
      'indent': instance.indent,
      'contents': instance.contents,
      'description': instance.description,
      'availabilityinfo': instance.availabilityinfo
    };

T _$enumDecode<T>(Map<T, dynamic> enumValues, dynamic source) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }
  return enumValues.entries
      .singleWhere((e) => e.value == source,
          orElse: () => throw ArgumentError(
              '`$source` is not one of the supported values: '
              '${enumValues.values.join(', ')}'))
      .key;
}

T _$enumDecodeNullable<T>(Map<T, dynamic> enumValues, dynamic source) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source);
}

const _$ModnameEnumMap = <Modname, dynamic>{
  Modname.FORUM: 'FORUM',
  Modname.RESOURCE: 'RESOURCE',
  Modname.FOLDER: 'FOLDER',
  Modname.URL: 'URL',
  Modname.QUIZ: 'QUIZ',
  Modname.FEEDBACK: 'FEEDBACK'
};

const _$ModpluralEnumMap = <Modplural, dynamic>{
  Modplural.FOREN: 'FOREN',
  Modplural.DATEIEN: 'DATEIEN',
  Modplural.VERZEICHNISSE: 'VERZEICHNISSE',
  Modplural.LINKS_UR_LS: 'LINKS_UR_LS',
  Modplural.TESTS: 'TESTS',
  Modplural.FEEDBACKS: 'FEEDBACKS'
};
