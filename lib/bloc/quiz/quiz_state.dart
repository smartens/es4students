import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class QuizState extends Equatable {
  QuizState([List props = const []]) : super(props);
}

class InitialQuizState extends QuizState {
  @override
  String toString() => 'InitialQuizState';
}

class QuizDataLoading extends QuizState {
  @override
  String toString() => 'QuizDataLoading';
}

class QuizDataLoaded extends QuizState {
  @override
  String toString() => 'QuizLoaded';
}
