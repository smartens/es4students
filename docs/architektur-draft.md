@startuml
left to right direction
skinparam componentStyle uml2

[Login] -- LoginState
[Login] --( LoginBloc

[Login BLoC] -- LoginBloc
[Login BLoC] --( LoginState
[Login BLoC] --( UserRepository

[Authentication BLoC] -- Authentication
[Authentication BLoC] --( LoginState

[Repository] -- UserRepository
[Repository] --( MoodleClient

[Moodle] -- MoodleClient

@enduml