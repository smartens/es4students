// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
      json['userid'] as int,
      json['username'] as String,
      json['firstname'] as String,
      json['lastname'] as String,
      json['fullname'] as String,
      json['lang'] as String,
      json['userpictureurl'] as String);
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'userid': instance.userid,
      'username': instance.username,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'fullname': instance.fullname,
      'lang': instance.lang,
      'userpictureurl': instance.userpictureurl
    };

Course _$CourseFromJson(Map<String, dynamic> json) {
  return Course(
      id: json['id'] as int,
      shortname: json['shortname'] as String,
      fullname: json['fullname'] as String,
      enrolledusercount: json['enrolledusercount'] as int,
      idnumber: json['idnumber'] as String,
      visible: json['visible'] as int,
      summary: json['summary'] as String,
      summaryformat: json['summaryformat'] as int,
      format: json['format'] as String,
      showgrades: json['showgrades'] as bool,
      lang: json['lang'] as String,
      enablecompletion: json['enablecompletion'] as bool,
      category: json['category'] as int,
      progress: json['progress'] as int,
      startdate: json['startdate'] as int,
      enddate: json['enddate'] as int);
}

Map<String, dynamic> _$CourseToJson(Course instance) => <String, dynamic>{
      'id': instance.id,
      'shortname': instance.shortname,
      'fullname': instance.fullname,
      'enrolledusercount': instance.enrolledusercount,
      'idnumber': instance.idnumber,
      'visible': instance.visible,
      'summary': instance.summary,
      'summaryformat': instance.summaryformat,
      'format': instance.format,
      'showgrades': instance.showgrades,
      'lang': instance.lang,
      'enablecompletion': instance.enablecompletion,
      'category': instance.category,
      'progress': instance.progress,
      'startdate': instance.startdate,
      'enddate': instance.enddate
    };

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

Content _$ContentFromJson(Map<String, dynamic> json) {
  return Content(
      type: json['type'] as String,
      filename: json['filename'] as String,
      filepath: json['filepath'] as String,
      filesize: json['filesize'] as int,
      fileurl: json['fileurl'] as String,
      timecreated: json['timecreated'] as int,
      timemodified: json['timemodified'] as int,
      sortorder: json['sortorder'] as int,
      mimetype: json['mimetype'] as String,
      isexternalfile: json['isexternalfile'] as bool,
      userid: json['userid'] as int,
      author: json['author'] as String,
      license: json['license'] as String);
}

Map<String, dynamic> _$ContentToJson(Content instance) => <String, dynamic>{
      'type': instance.type,
      'filename': instance.filename,
      'filepath': instance.filepath,
      'filesize': instance.filesize,
      'fileurl': instance.fileurl,
      'timecreated': instance.timecreated,
      'timemodified': instance.timemodified,
      'sortorder': instance.sortorder,
      'mimetype': instance.mimetype,
      'isexternalfile': instance.isexternalfile,
      'userid': instance.userid,
      'author': instance.author,
      'license': instance.license
    };
