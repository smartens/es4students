import 'package:bloc/bloc.dart';
import 'package:es4students/bloc/simple_bloc_delegate.dart';
import 'package:es4students/data/provider/moodle_client.dart';
import 'package:es4students/data/repository/component.dart';
import 'package:es4students/data/repository/user_repository.dart';
import 'package:es4students/view/app.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  final UserRepository userRepository = UserRepository(
    moodleApiClient: MoodleApiClient(
      httpClient: http.Client(),
    ),
  );

  BlocSupervisor().delegate = SimpleBlocDelegate();
  runApp(App(userRepository: userRepository));

  //Backend Testing
/* 
  final CourseRepository courseRepository = CourseRepository(
      moodleApiClient: MoodleApiClient(httpClient: http.Client()));
  print(userRepository.getUserId('124da2c217605ccb2fe6d69782828cad'));
  print(courseRepository.getCourseList('124da2c217605ccb2fe6d69782828cad')); */
}
