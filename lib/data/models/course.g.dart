// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
