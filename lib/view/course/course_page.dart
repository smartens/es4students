import 'package:flutter/material.dart';

import 'package:ES4students/view/pdf/pdf_viewer.dart';

class CoursePage extends StatelessWidget {
  final String name;
  final List<String> pdfURLs;

  CoursePage({
    Key key,
    @required this.name,
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
          children: pdfs ?? null,
        )
    );
  }
}
