import 'package:flutter/material.dart';
import 'package:invoice_generator_app/utils/global_class.dart';
import 'package:invoice_generator_app/utils/print_screen.dart';

class PdfScreen extends StatefulWidget {
  const PdfScreen({super.key});

  @override
  State<PdfScreen> createState() => _PdfScreenState();
}

class _PdfScreenState extends State<PdfScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: Text("Pdf Generate", style: TextStyle(color: Colors.white)),
            centerTitle: true, actions: [
               IconButton(
                   onPressed: () {
                 getPDF();
               }, icon: Icon(Icons.print)),
        ]),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                const Row(
                  children: [
                    Spacer(),
                    Text(
                      "INVOICE",
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "BILLED TO:",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 15),
                            ),
                            Text(
                              "Imani Olowe",
                              style: TextStyle(fontSize: 15),
                            ),
                            Text(
                              "+123-456-789",
                              style: TextStyle(fontSize: 15),
                            ),
                            Text(
                              "63,ly Road,hawakville GA,",
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Invoice no.12345",
                              style: TextStyle(fontSize: 17),
                            ),
                            Text(
                              "16 june 2023",
                              style: TextStyle(fontSize: 17),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("No",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    Text("Name",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    Text("Quantity",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    Text("Total",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Column(
                  children: Global.g1.detaillist
                      .map(
                        (e) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("${e['No']}",
                                style: const TextStyle(fontSize: 14)),
                            Text("${e['Name']}",
                                style: const TextStyle(fontSize: 14)),
                            Text("${e['Quantity']}",
                                style: const TextStyle(fontSize: 14)),
                            Text("${e['total']}",
                                style: const TextStyle(fontSize: 14)),
                          ],
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
