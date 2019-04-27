// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
