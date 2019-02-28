import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:introduction_screen/model/page_view_model.dart';

import 'package:app/view/login/login_page.dart';

class OnBoardingPage extends StatelessWidget {
  final pages = [
    PageViewModel(
      "Deine Lernmaterialen überall mit dabei", //Titel
      "auch offline", //Beschreibung
      Image.asset(
        'images/erp4students_logo.png',
        fit: BoxFit.cover,
      ),
    ),
    PageViewModel(
      "Mache Quizzes überall und fordere dich heraus", //Titel
      "", //Beschreibung leer
      Image.asset(
        'images/erp4students_logo.png',
        fit: BoxFit.cover,
      ),
    ),
    PageViewModel(
      "Checke deine Fortschritte", //Titel
      "Bleibe dran", //Beschreibung
      Image.asset(
        'images/erp4students_logo.png',
        fit: BoxFit.cover,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: pages,
      onDone: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      },
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
    );
  }
}
