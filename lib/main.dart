import 'package:es4students/bloc/simple_bloc_delegate.dart';
import 'package:es4students/view/root_widget.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

void main() {
  BlocSupervisor().delegate = SimpleBlocDelegate();
  runApp(RootWidget());
}
