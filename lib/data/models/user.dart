import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

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
