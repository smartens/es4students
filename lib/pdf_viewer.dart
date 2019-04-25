import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:path_provider/path_provider.dart';

import 'package:ES4students/view/pdf_viewer_page.dart';

class PDFViewer extends StatefulWidget {
  final String url;

  PDFViewer({
    Key key,
    @required this.url,
  })
      : assert(url != null),
        super(key: key);

  @override
  _PDFViewerState createState() => _PDFViewerState();
}

class _PDFViewerState extends State<PDFViewer> {
  String pathPDF = "";

  @override
  void initState() {
    super.initState();
    createFileOfPdfUrl(widget.url).then((f) {
      setState(() {
        pathPDF = f.path;
        print("Pfad: " + pathPDF);
      });
    });
  }

  Future<File> createFileOfPdfUrl(String url) async {
    final filename = url.substring(url.lastIndexOf("/") + 1);
    var request = await HttpClient().getUrl(Uri.parse(url));
    var response = await request.close();
    var bytes = await consolidateHttpClientResponseBytes(response);
    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = new File('$dir/$filename');
    await file.writeAsBytes(bytes);
    return file;
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text("Open PDF"),
      onPressed: () =>
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PDFViewerPage(pathPDF: pathPDF)),
      ),
    );
  }
}
