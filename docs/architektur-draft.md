@startuml
left to right direction
skinparam componentStyle uml2
skinparam component {
  FontSize 18
}
skinparam interface {
    FontSize 18
}

[View] -d- LoginPage
[View] -d- CourseListPage

[Main] -u-( LoginPage
[Main] -u-( CourseListPage
[Main] -d-( UserRepository
[Main] -d-( AuthenticationBloc
[Main] -d-( AuthenticationEvent

[Login] -d-( UserRepository
[Login] --( AuthenticationEvent
[Login] --( AuthenticationBloc

[Authentication] -u- AuthenticationEvent
[Authentication] -u- AuthenticationBloc
[Authentication] -d-( UserRepository

[Repository] -u- UserRepository
[Repository] -u- CourseListRepository
[Repository] -d-( MoodleAPI
[Repository] -d-( WordPressAPI

[Network] -u- MoodleAPI
[Network] -u- WordPressAPI

[CoursesList] --( AuthenticationEvent
[CoursesList] --( AuthenticationBloc
[CoursesList] -d-( CourseListRepository

@enduml