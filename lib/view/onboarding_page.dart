import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:introduction_screen/model/page_view_model.dart';

import 'package:ES4students/authentication/authentication_bloc.dart';
import 'package:ES4students/authentication/authentication_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


const logo = 'images/erp4students_logo.png';

class OnBoardingPage extends StatelessWidget {

  final pages = [
    PageViewModel(
        "Deine Lernmaterialen überall mit dabei", //Titel
        "auch offline", //Beschreibung
        image: new LayoutBuilder(builder: (context, constraint) {
        return new Icon(Icons.access_alarms, size: constraint.biggest.height);
      }),

    ),
    PageViewModel(
        "Mache Quizzes überall und fordere dich heraus", //Titel
        "", //Beschreibung leer
        image: Center(child: Image.asset(logo))
    ),
    PageViewModel(
        "Checke deine Fortschritte", //Titel
        "Bleibe dran", //Beschreibung
        image: Center(child: Image.asset(logo))
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final AuthenticationBloc authenticationBloc =
     BlocProvider.of<AuthenticationBloc>(context);
    
    return IntroductionScreen(
      pages: pages,
      onDone: () {
        authenticationBloc.dispatch(OnboardingFinished());
      },
      done: const Text('Fertig', style: TextStyle(fontWeight: FontWeight.w600)),
    );
  }
}
