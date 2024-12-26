import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';

class PdfGeneratorScreen extends StatelessWidget {
  Future<void> generateResumePdf(BuildContext context) async {
    final pdf = pw.Document();

    // Add a page with formatted text and layout
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        margin: pw.EdgeInsets.all(32),
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              // Title Section
              pw.Text(
                'Narin Kongmajai',
                style: pw.TextStyle(
                  fontSize: 24,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.SizedBox(height: 4),
              pw.Text(
                '1234 Phayathai Road, Pathumwan, Bangkok 10330 | (662) 218-1234 | narinkongmajai@gmail.com',
                style: pw.TextStyle(fontSize: 12),
              ),
              pw.Divider(),

              // Summary Section
              pw.Text(
                'SUMMARY',
                style: pw.TextStyle(
                  fontSize: 14,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.Text(
                'Self-motivated; able to learn on own initiative. Capable of working with anyone, funny, and outgoing. Eager to learn everything about the international business and marketing. Positive attitude, respectful, and courteous manner.',
                style: pw.TextStyle(fontSize: 12),
              ),
              pw.SizedBox(height: 8),

              // Education Section
              pw.Text(
                'EDUCATION',
                style: pw.TextStyle(
                  fontSize: 14,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.Text(
                'Chulalongkorn University – Chulalongkorn Business School',
                style:
                    pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold),
              ),
              pw.Text(
                'Bachelor of Business Administration, Concentration in International Business',
                style: pw.TextStyle(fontSize: 12),
              ),
              pw.Text(
                'Cumulative GPA: 3.73 / 4.00 - May 2015',
                style: pw.TextStyle(fontSize: 12),
              ),
              pw.SizedBox(height: 8),

              pw.Text(
                'University of Southern California',
                style:
                    pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold),
              ),
              pw.Text(
                'USC Marshall International Exchange Program participant',
                style: pw.TextStyle(fontSize: 12),
              ),
              pw.Text(
                'Spring 2014 - Los Angeles, CA',
                style: pw.TextStyle(fontSize: 12),
              ),
              pw.SizedBox(height: 8),

              // Experience Section
              pw.Text(
                'EXPERIENCE',
                style: pw.TextStyle(
                  fontSize: 14,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.SizedBox(height: 4),
              pw.Text(
                '1234 Company, Inc.',
                style:
                    pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold),
              ),
              pw.Text(
                'Brokerage, E-Business and Research Intern - Summer 2014',
                style: pw.TextStyle(fontSize: 12),
              ),
              pw.Bullet(
                text: 'Shadows Brokers and E-Business employees',
                style: pw.TextStyle(fontSize: 12),
              ),
              pw.Bullet(
                text:
                    'Visited a company and wrote a recommendation paper for its IPO',
                style: pw.TextStyle(fontSize: 12),
              ),
              pw.Bullet(
                text: 'Wrote interview questions for a television program',
                style: pw.TextStyle(fontSize: 12),
              ),
              pw.SizedBox(height: 8),

              // Skills Section
              pw.Text(
                'SKILLS & INTERESTS',
                style: pw.TextStyle(
                  fontSize: 14,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.Text(
                'Languages: Fluent in Thai, English, and Chinese',
                style: pw.TextStyle(fontSize: 12),
              ),
              pw.Text(
                'Computer Skills: Microsoft Office, Adobe Photoshop',
                style: pw.TextStyle(fontSize: 12),
              ),
              pw.Text(
                'Interests: Baking, traveling, running, and reading',
                style: pw.TextStyle(fontSize: 12),
              ),
            ],
          );
        },
      ),
    );

    // Save PDF to file
    try {
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/resume.pdf';
      final file = File(filePath);
      await file.writeAsBytes(await pdf.save());

      // Open the PDF
      OpenFile.open(filePath);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('PDF generated successfully!')),
      );
    } catch (e) {
      print('Error saving PDF: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to generate PDF')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PDF Generator')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => generateResumePdf(context),
          child: Text('Generate PDF'),
        ),
      ),
    );
  }
}
