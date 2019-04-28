import 'package:es4students/bloc/authentication/component.dart';
import 'package:es4students/main.dart';
import 'package:es4students/view/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RootWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: AuthenticationBloc(),
      child: MaterialApp(
        home: Home(),
      ),
    );
  }
}
