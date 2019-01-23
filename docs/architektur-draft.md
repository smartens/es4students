@startuml

skinparam componentStyle uml2

[Login] --( UserRepository
[Login] --( AuthenticationEvent
[Login] --( AuthenticationBloc

[Authentication] -- AuthenticationEvent
[Authentication] -- AuthenticationBloc
[Authentication] --( UserRepository

[Repository] -- UserRepository
[Repository] --( MoodleAPI
[Repository] --( WordPressAPI

[Network] -- MoodleAPI
[Network] -- WordPressAPI

[Home] --( AuthenticationEvent
[Home] --( AuthenticationBloc

@enduml