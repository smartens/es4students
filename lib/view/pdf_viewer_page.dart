import 'package:flutter/material.dart';

import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';

class PDFViewerPage extends StatelessWidget {
  final String pathPDF;
  final String namePDF = "Dokument";

  PDFViewerPage({
    Key key,
    @required this.pathPDF,
    namePDF,
  })  : assert(pathPDF != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(
      appBar: AppBar(
        title: Text(namePDF),
      ),
      path: pathPDF,
    );
  }
}
