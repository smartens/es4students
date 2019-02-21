import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

/// Repräsentiert den Zustand der Profile Komponente
abstract class ProfileState extends Equatable {
  ProfileState([List props = const []]) : super(props);
}
