import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

import 'package:pdf/widgets.dart' as pw;
import 'package:open_file/open_file.dart';

class BeautifulPdfScreen extends StatelessWidget {
  const BeautifulPdfScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Beautiful PDF'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                "Lorem Ipsum is simply dummy....",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Description:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Center(
              child: Image.asset(
                'assets/lorem.jpg',
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  generatePdf(context);
                },
                child: const Text('Generate PDF'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> generatePdf(BuildContext context) async {
    final pdf = pw.Document();

    final imageBytes = await rootBundle.load('assets/lorem.jpg');
    final image = pw.MemoryImage(imageBytes.buffer.asUint8List());

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Center(
                child: pw.Text(
                  "My Awesome PDF",
                  style: pw.TextStyle(
                    fontSize: 28,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
              ),
              pw.SizedBox(height: 20),
              pw.Text(
                "Description:",
                style: pw.TextStyle(
                  fontSize: 18,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.SizedBox(height: 10),
              pw.Text(
                "This is an example of a beautifully designed one-page PDF that includes a title, description, and an image. You can customize it further based on your needs.",
                style: pw.TextStyle(fontSize: 16),
              ),
              pw.SizedBox(height: 20),
              pw.Center(
                child: pw.Image(
                  image,
                  height: 200,
                  fit: pw.BoxFit.cover,
                ),
              ),
            ],
          );
        },
      ),
    );

    try {
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/BeautifulDesign.pdf';
      final file = File(filePath);
      await file.writeAsBytes(await pdf.save());
      OpenFile.open(filePath);
    } catch (e) {
      print('Error generating PDF: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error generating PDF')),
      );
    }
  }
}
