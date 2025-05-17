import 'dart:io';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_media_downloader/flutter_media_downloader.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class PDFViewScreen extends StatefulWidget {
  const PDFViewScreen({
    super.key,
  });

  @override
  State<PDFViewScreen> createState() => _PDFViewScreenState();
}

class _PDFViewScreenState extends State<PDFViewScreen> {
  final _flutterMediaDownloaderPlugin = MediaDownload();
  String localPath = "";

  @override
  void initState() {
    super.initState();
    downloadPdf();
  }

  Future<void> downloadPdf() async {
    try {
      // Get the application's document directory
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/downloaded.pdf';

      // Send HTTP GET request to download the PDF
      final response = await http.get(Uri.parse(
          'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf'));

      if (response.statusCode == 200) {
        // Write the PDF bytes to a file
        final file = File(filePath);
        await file.writeAsBytes(response.bodyBytes);

        setState(() {
          localPath = filePath;
        });
      } else {
        log('Failed to load PDF');
      }
    } catch (e) {
      log('Error loading PDF: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    log("===> PDF URL: ${'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf'}");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 70,
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: BackButton(
          color: Colors.white,
          onPressed: () {},
        ),
        title: const Text(
          'Download PDF',
        ),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              _flutterMediaDownloaderPlugin.downloadMedia(context,
                  'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf');
            },
            child: const Text('Media Download')),
      ),
    );
  }
}
