import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import 'global_class.dart';

Future<void> getPDF() async {
  var pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Column(
          children: [
            pw.Row(
              children: [
                pw.Spacer(),
                pw.Text(
                  "INVOICE",
                  style: pw.TextStyle(
                      fontSize: 35, fontWeight: pw.FontWeight.bold),
                ),
              ],
            ),
            pw.SizedBox(height: 10),
            pw.Column(
              children: [
                pw.Row(
                  children: [
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          "BILLED TO:",
                          style: pw.TextStyle(
                              fontWeight: pw.FontWeight.bold, fontSize: 15),
                        ),
                        pw.Text(
                          "Imani Olowe",
                          style: pw.TextStyle(fontSize: 15),
                        ),
                        pw.Text(
                          "+123-456-789",
                          style: pw.TextStyle(fontSize: 15),
                        ),
                        pw.Text(
                          "63,ly Road,hawakville GA,",
                          style: pw.TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                    pw.Spacer(),
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          "Invoice no.12345",
                          style: pw.TextStyle(fontSize: 17),
                        ),
                        pw.Text(
                          "16 june 2023",
                          style: pw.TextStyle(fontSize: 17),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            pw.SizedBox(height: 20),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
              children: [
                pw.Text("No",
                    style: pw.TextStyle(
                        fontSize: 16, fontWeight: pw.FontWeight.bold)),
                pw.Text("Name",
                    style: pw.TextStyle(
                        fontSize: 16, fontWeight: pw.FontWeight.bold)),
                pw.Text("Quantity",
                    style: pw.TextStyle(
                        fontSize: 16, fontWeight: pw.FontWeight.bold)),
                pw.Text("Total",
                    style: pw.TextStyle(
                        fontSize: 16, fontWeight: pw.FontWeight.bold)),
              ],
            ),
            pw.SizedBox(
              height: 15,
            ),
            pw.Column(
              children: Global.g1.detaillist
                  .map(
                    (e) => pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                      children: [
                        pw.Text("${e['No']}",
                            style: pw.TextStyle(fontSize: 14)),
                        pw.Text("${e['Name']}",
                            style: pw.TextStyle(fontSize: 14)),
                        pw.Text("${e['Quantity']}",
                            style: pw.TextStyle(fontSize: 14)),
                        pw.Text("${e['total']}",
                            style: pw.TextStyle(fontSize: 14)),
                      ],
                    ),
                  )
                  .toList(),
            ),
          ],
        );
      },
    ),
  );
  await Printing.layoutPdf(
    onLayout: (format) async =>pdf.save(),
  );// Page
}
