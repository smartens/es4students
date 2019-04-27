import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:ES4students/data/models/models.dart';
import 'package:bloc/bloc.dart';
import 'package:ES4students/repository/course_repository.dart';

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

// ----------------------------------------------------------------------------

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

// ----------------------------------------------------------------------------

class CourseListBloc extends Bloc<CourseListEvent, CourseListState> {
  //final CourseRepository courseRepository;

  @override
  CourseListState get initialState => CourseListEmpty();

  @override
  Stream<CourseListState> mapEventToState(CourseListEvent event) async* {
    if (event is FetchCourseList) {
      yield CourseListLoading();

      try {
        //final List<Course> courseList = await courseRepository.getUserCoursesList(event.userid);
      } catch (e) {}
    }
  }
}
