import 'package:equatable/equatable.dart';
import 'package:es4students/data/models/models.dart';
import 'package:meta/meta.dart';

@immutable
abstract class CourseListState extends Equatable {
  CourseListState([List props = const []]) : super(props);
}

class CourseListInitialized extends CourseListState {
  @override
  String toString() => 'InitialCourseListState';
}

class CourseListLoadingState extends CourseListState {
  @override
  String toString() => 'CourseListLoading';
}

class CourseListLoadingFailed extends CourseListState {
  @override
  String toString() => 'CourseListLoadingFailure';
}

class CourseListLoaded extends CourseListState {
  final List<Course> courseList;

  CourseListLoaded({@required this.courseList});

  @override
  String toString() => 'CourseListLoaded';
}
