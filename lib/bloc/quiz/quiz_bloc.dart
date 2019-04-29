import 'dart:async';
import 'package:bloc/bloc.dart';
import './component.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  @override
  QuizState get initialState => InitialQuizState();

  @override
  Stream<QuizState> mapEventToState(
    QuizEvent event,
  ) async* {
    if (event is LoadQuizData) {
      yield QuizDataLoaded();
    }
  }
}
