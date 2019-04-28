import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

/// Basisklasse für Events der Loginoberfläche
abstract class ProfileEvent extends Equatable {
  ProfileEvent([List props = const []]) : super(props);
}

class CourseTilePressed extends ProfileEvent {
  final String courseName;

  CourseTilePressed({
    @required this.courseName,
  }) : super([courseName]);

  @override
  String toString() => 'CourseTilePressed { courseName: $courseName }';
}
