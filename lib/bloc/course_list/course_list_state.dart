import 'package:equatable/equatable.dart';
import 'package:es4students/data/models/course.dart';
import 'package:meta/meta.dart';

@immutable
abstract class CourseListState extends Equatable {
  CourseListState([List props = const []]) : super(props);
}

class CourseListEmpty extends CourseListState {}

class CourseListLoading extends CourseListState {}

class CourseListLoaded extends CourseListState {
  final List<Course> courseList;

  CourseListLoaded({@required this.courseList})
      : assert(courseList != null),
        super([courseList]);
}

class CourseListError extends CourseListState {}
