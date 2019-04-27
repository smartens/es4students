import 'package:flutter/material.dart';

import 'package:es4students/views/course/course_section_tile.dart';
import 'package:es4students/views/pdf/pdf_viewer.dart';

class CoursePage extends StatelessWidget {
  final String name;
  final List<String> pdfURLs;
  final List<CourseSectionTile> courseSections;

  CoursePage({
    Key key,
    @required this.name,
    this.courseSections,
    this.pdfURLs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> pdfs = new List<Widget>();
    if (pdfURLs != null)
      pdfURLs.forEach((String s) => pdfs.add(new PDFViewer(url: s)));

    return Scaffold(
        appBar: AppBar(
          title: Text(name),
          centerTitle: true,
        ),
        body: ListView(
          children: courseSections ?? null,
        ));
  }
}
