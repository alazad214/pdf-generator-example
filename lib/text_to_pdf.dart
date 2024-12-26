import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:open_file/open_file.dart';

class TextToPdfScreen extends StatefulWidget {
  @override
  _TextToPdfScreenState createState() => _TextToPdfScreenState();
}

class _TextToPdfScreenState extends State<TextToPdfScreen> {
  final TextEditingController textController = TextEditingController();

  Future<void> generatePdf(String text) async {
    try {
      // Create a PDF document
      final pdf = pw.Document();

      // Add a page with the text
      pdf.addPage(
        pw.Page(
          build: (pw.Context context) {
            return pw.Center(
              child: pw.Text(
                text,
                style: pw.TextStyle(fontSize: 18),
              ),
            );
          },
        ),
      );

      // Get the application's document directory
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/GeneratedText.pdf';

      // Save the PDF file
      final file = File(filePath);
      await file.writeAsBytes(await pdf.save());

      // Open the PDF file
      OpenFile.open(filePath);
    } catch (e) {
      print('Error generating PDF: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Text to PDF')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: textController,
              maxLines: 5,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Text',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final text = textController.text.trim();
                if (text.isNotEmpty) {
                  generatePdf(text);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please enter some text')),
                  );
                }
              },
              child: Text('Generate PDF'),
            ),
          ],
        ),
      ),
    );
  }
}
