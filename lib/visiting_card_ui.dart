import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:open_filex/open_filex.dart';

class BusinessCardScreen extends StatelessWidget {
  const BusinessCardScreen({super.key});

  Future<void> createBusinessCardPdf(BuildContext context) async {
    final pdf = pw.Document();

    // Define a red gradient
    final redGradient = pw.BoxDecoration(
      gradient: pw.LinearGradient(
        colors: [
          PdfColor.fromInt(0xFFE94E37),
          PdfColor.fromInt(0xFFC42F1F),
        ],
        begin: pw.Alignment.topRight,
        end: pw.Alignment.bottomLeft,
      ),
    );

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a3,
        build: (context) {
          return pw.Stack(
            children: [
              pw.Column(children: [
                // Left white background
                pw.Positioned(
                  left: 0,
                  top: 0,
                  bottom: 0,
                  right: PdfPageFormat.a6.width * (1 - 0.6),
                  child: pw.Container(
                    color: PdfColors.white,
                    padding: const pw.EdgeInsets.symmetric(
                        horizontal: 15, vertical: 20),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      children: [
                        contactRow('📞', '+231 777 000 000'),
                        pw.SizedBox(height: 6),
                        contactRow('📞', '+231 888 000 000'),
                        pw.SizedBox(height: 12),
                        contactRow('📧', 'info@cmc.com.lr'),
                        pw.SizedBox(height: 12),
                        contactRow('🌐', 'www.cmc.com.lr'),
                        pw.SizedBox(height: 12),
                        contactRow('📍', 'Sophie Community'),
                        pw.Text('Monrovia, Liberia',
                            style: pw.TextStyle(fontSize: 9)),
                      ],
                    ),
                  ),
                ),

                // Right red curved background with text
                pw.Positioned(
                  right: 0,
                  top: 0,
                  bottom: 0,
                  left: PdfPageFormat.a6.width * (1 - 0.55),
                  child: pw.Container(
                    decoration: redGradient,
                    // ClipPath is not directly supported in pdf, so simulate curved shape with ellipse
                    child: pw.Stack(
                      children: [
                        pw.Positioned(
                          left: -PdfPageFormat.a6.width * 0.15,
                          top: 0,
                          bottom: 0,
                          child: pw.Container(
                            width: PdfPageFormat.a6.width * 0.5,
                            decoration: pw.BoxDecoration(
                              color: PdfColors.white,
                              borderRadius: pw.BorderRadius.horizontal(
                                  right: pw.Radius.elliptical(150, 400)),
                            ),
                          ),
                        ),
                        pw.Center(
                          child: pw.Padding(
                            padding:
                                const pw.EdgeInsets.symmetric(horizontal: 20),
                            child: pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.center,
                              crossAxisAlignment: pw.CrossAxisAlignment.end,
                              children: [
                                pw.Text(
                                  'JONATHEN SMITH',
                                  style: pw.TextStyle(
                                    fontSize: 22,
                                    fontWeight: pw.FontWeight.bold,
                                    color: PdfColors.white,
                                  ),
                                  textAlign: pw.TextAlign.right,
                                ),
                                pw.SizedBox(height: 10),
                                pw.Text(
                                  'CHAIRMAN',
                                  style: pw.TextStyle(
                                    fontSize: 12,
                                    color: PdfColors.white,
                                  ),
                                  textAlign: pw.TextAlign.right,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
              pw.Column(children: [
                // Left white background
                pw.Positioned(
                  left: 0,
                  top: 0,
                  bottom: 0,
                  right: PdfPageFormat.a6.width * (1 - 0.6),
                  child: pw.Container(
                    color: PdfColors.white,
                    padding: const pw.EdgeInsets.symmetric(
                        horizontal: 15, vertical: 20),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      children: [
                        contactRow('📞', '+231 777 000 000'),
                        pw.SizedBox(height: 6),
                        contactRow('📞', '+231 888 000 000'),
                        pw.SizedBox(height: 12),
                        contactRow('📧', 'info@cmc.com.lr'),
                        pw.SizedBox(height: 12),
                        contactRow('🌐', 'www.cmc.com.lr'),
                        pw.SizedBox(height: 12),
                        contactRow('📍', 'Sophie Community'),
                        pw.Text('Monrovia, Liberia',
                            style: pw.TextStyle(fontSize: 9)),
                      ],
                    ),
                  ),
                ),

                // Right red curved background with text
                pw.Positioned(
                  right: 0,
                  top: 0,
                  bottom: 0,
                  left: PdfPageFormat.a6.width * (1 - 0.55),
                  child: pw.Container(
                    decoration: redGradient,
                    // ClipPath is not directly supported in pdf, so simulate curved shape with ellipse
                    child: pw.Stack(
                      children: [
                        pw.Positioned(
                          left: -PdfPageFormat.a6.width * 0.15,
                          top: 0,
                          bottom: 0,
                          child: pw.Container(
                            width: PdfPageFormat.a6.width * 0.5,
                            decoration: pw.BoxDecoration(
                              color: PdfColors.white,
                              borderRadius: pw.BorderRadius.horizontal(
                                  right: pw.Radius.elliptical(150, 400)),
                            ),
                          ),
                        ),
                        pw.Center(
                          child: pw.Padding(
                            padding:
                                const pw.EdgeInsets.symmetric(horizontal: 20),
                            child: pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.center,
                              crossAxisAlignment: pw.CrossAxisAlignment.end,
                              children: [
                                pw.Text(
                                  'JONATHEN SMITH',
                                  style: pw.TextStyle(
                                    fontSize: 22,
                                    fontWeight: pw.FontWeight.bold,
                                    color: PdfColors.white,
                                  ),
                                  textAlign: pw.TextAlign.right,
                                ),
                                pw.SizedBox(height: 10),
                                pw.Text(
                                  'CHAIRMAN',
                                  style: pw.TextStyle(
                                    fontSize: 12,
                                    color: PdfColors.white,
                                  ),
                                  textAlign: pw.TextAlign.right,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            ],
          );
        },
      ),
    );

    try {
      final outputDir = await getApplicationDocumentsDirectory();
      final filePath = '${outputDir.path}/business_card.pdf';
      final file = File(filePath);

      await file.writeAsBytes(await pdf.save());

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Saved to $filePath")),
      );

      final result = await OpenFilex.open(filePath);
      if (result.type != ResultType.done) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Could not open PDF")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }
  }

  pw.Widget contactRow(String icon, String text) {
    return pw.Row(
      crossAxisAlignment: pw.CrossAxisAlignment.center,
      children: [
        pw.Text(icon, style: const pw.TextStyle(fontSize: 12)),
        pw.SizedBox(width: 8),
        pw.Text(text, style: const pw.TextStyle(fontSize: 9)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Business Card PDF")),
      body: Center(
        child: ElevatedButton(
          onPressed: () => createBusinessCardPdf(context),
          child: const Text("Generate & Open Business Card"),
        ),
      ),
    );
  }
}
