import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_filex/open_filex.dart';

class PdfDownloadScreen extends StatefulWidget {
  const PdfDownloadScreen({super.key});

  @override
  State<PdfDownloadScreen> createState() => _PdfDownloadScreenState();
}

class _PdfDownloadScreenState extends State<PdfDownloadScreen> {
  String _statusMessage = "Press the button to download the PDF";
  Future<void> downloadPdf(String url) async {
    try {
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String savePath = "${appDocDir.path}/downloadedFile.pdf";

      Dio dio = Dio();
      await dio.download(url, savePath);

      setState(() {
        _statusMessage = "PDF Downloaded to: $savePath";
      });

      await openFile(savePath);
    } catch (e) {
      setState(() {
        _statusMessage = "Error downloading file: $e";
      });
    }
  }

  Future<void> openFile(String filePath) async {
    try {
      if (await File(filePath).exists()) {
        await OpenFilex.open(filePath);
      } else {
        setState(() {
          _statusMessage = "File does not exist";
        });
      }
    } catch (e) {
      setState(() {
        _statusMessage = "Error opening file: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    log(_statusMessage);
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Download Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_statusMessage),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                downloadPdf('https://www.orimi.com/pdf-test.pdf');
              },
              child: const Text('Download PDF'),
            ),
          ],
        ),
      ),
    );
  }
}
