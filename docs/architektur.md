@startuml
left to right direction
skinparam componentStyle uml2

    [Course List] -- CourseListState
    [Course Detail] -- CourseDetailState
    [User Profile] -- UserProfileState
    [Login] -- LoginState
    [Login] --( LoginBloc
    [PDF Viewer] -- PDFViewerState
    [PDF Viewer] --( PdfBloc


    [Login BLoC] -- LoginBloc
    [Login BLoC] --( LoginState
    [Login BLoC] --( User
    [Authentication BLoC] -- Authentication
    [Authentication BLoC] --( LoginState
    [Course BLoC] --( CourseDetailState
    [Course BLoC] --( CourseListState
    [Course BLoC] --( Course
    [PDF BLoC] -- PdfBloc


    [User Repository] -- User
    [Course Repository] -- Course



@enduml