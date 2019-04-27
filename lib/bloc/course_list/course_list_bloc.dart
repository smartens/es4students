import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:es4students/bloc/course_list/course_list_event.dart';
import 'package:es4students/bloc/course_list/course_list_state.dart';

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
