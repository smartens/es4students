import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class CourseListEvent extends Equatable {
  CourseListEvent([List props = const []]) : super(props);
}

class FetchCourseList extends CourseListEvent {
  final int userid;

  FetchCourseList({@required this.userid})
      : assert(userid != null),
        super([userid]);
}

class RefreshCourseList extends CourseListEvent {
  final int userid;

  RefreshCourseList({@required this.userid})
      : assert(userid != null),
        super([userid]);
}

class CourseSelected extends CourseListEvent {
  //final int courseid;
}
