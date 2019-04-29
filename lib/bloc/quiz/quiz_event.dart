import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class QuizEvent extends Equatable {
  QuizEvent([List props = const []]) : super(props);
}

class LoadQuizData extends QuizEvent {
  @override
  String toString() => 'LoadQuizData';
}
