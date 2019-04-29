import 'package:meta/meta.dart';

@immutable
abstract class CourseListState {}

class InitialCourseListState extends CourseListState {
  @override
  String toString() => 'InitialCourseListState';
}

class CourseListLoading extends CourseListState {
  @override
  String toString() => 'CourseListLoading';
}

class CourseListLoadingFailure extends CourseListState {
  @override
  String toString() => 'CourseListLoadingFailure';
}

class DisplayCourseList extends CourseListState {
  @override
  String toString() => 'CourseListLoaded';
}
