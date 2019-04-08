import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:introduction_screen/model/page_view_model.dart';

import 'package:app/repository/user_repository.dart';
import 'package:app/view/login/login_page.dart';

const logo = 'images/erp4students_logo.png';

class OnBoardingPage extends StatelessWidget {

  final UserRepository userRepository;

  OnBoardingPage({Key key, @required this.userRepository}) : super(key: key);

  final pages = [
    PageViewModel(
        "Deine Lernmaterialen überall mit dabei", //Titel
        "auch offline", //Beschreibung
        image: Center(child: Image.asset(logo))
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
    return IntroductionScreen(
      pages: pages,
      onDone: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => LoginPage(userRepository: userRepository,)),
        );
      },
      done: const Text('Fertig', style: TextStyle(fontWeight: FontWeight.w600)),
    );
  }
}
