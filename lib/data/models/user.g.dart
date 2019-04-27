// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

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
