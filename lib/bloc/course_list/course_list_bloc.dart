import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:es4students/data/models/models.dart';
import 'package:es4students/data/repository/course_repository.dart';
import 'package:meta/meta.dart';
import './component.dart';

class CourseListBloc extends Bloc<CourseListEvent, CourseListState> {
  final CourseRepository courseRepository;

  CourseListBloc({@required this.courseRepository})
      : assert(courseRepository != null);

  @override
  CourseListState get initialState => CourseListInitialized();

  @override
  Stream<CourseListState> mapEventToState(
    CourseListEvent event,
  ) async* {
    if (event is LoadCourseList) {
      yield CourseListLoadingState();
      try {
        List<Course> courseList = await courseRepository.getCourseList();
        yield CourseListLoaded(courseList: courseList);
      } catch (e) {
        yield CourseListLoadingFailed();
      }
    }
  }
}
