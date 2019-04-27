import 'package:es4students/blocs/simple_bloc_delegate.dart';
import 'package:es4students/views/root_widget.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

void main() {
  BlocSupervisor().delegate = SimpleBlocDelegate();
  runApp(RootWidget());
}
