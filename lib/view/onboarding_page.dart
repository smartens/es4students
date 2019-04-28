import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:introduction_screen/model/page_view_model.dart';

import 'package:ES4students/authentication/authentication_bloc.dart';
import 'package:ES4students/authentication/authentication_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const logo = 'images/erp4students_logo.png';

class OnBoardingPage extends StatelessWidget {

  final pages = [
    PageViewModel(
        "Deine Lernmaterialen überall dabei", //Titel
        "", //Beschreibung
      image: Center(child: Image.asset('images/mobility_icon.png', width: 250)),
    ),
    PageViewModel(
        "Fordere dich in einem Quiz heraus", //Titel
        "", //Beschreibung leer
      image: Center(child: Image.asset('images/test_icon.png', width: 250)),
    ),
    PageViewModel(
        "Checke deine Fortschritte", //Titel
        "", //Beschreibung
      image: Center(child: Image.asset('images/process_icon.png', width: 250)),
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
