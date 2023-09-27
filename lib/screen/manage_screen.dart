import 'package:flutter/material.dart';
import 'package:invoice_generator_app/utils/global_class.dart';

class ManageScreen extends StatefulWidget {
  const ManageScreen({super.key});

  @override
  State<ManageScreen> createState() => _ManageScreenState();
}

class _ManageScreenState extends State<ManageScreen> {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtNumber = TextEditingController();
  double total=0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title:const Text("Mange Products",
                style: TextStyle(color: Colors.white)),
        actions: [
           InkWell(
             onTap:  () {
               Navigator.pushNamed(context,'pdf');
             },
               child: const Icon(Icons.picture_as_pdf,color: Colors.white)),
        ]),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: Global.g1.detaillist.map((e) => Container(
              margin: const EdgeInsets.all(10),
              height: 140,
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.grey.shade300,borderRadius: BorderRadius.circular(4)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("No:${e['No']}",style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
                            const SizedBox(height: 7),
                            Text("Name: ${e["Name"]}",style: const TextStyle(fontSize: 22,fontWeight: FontWeight.w500),),
                            const SizedBox(height: 7),
                            Text("Amount : ${e["total"]}",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                            const SizedBox(height: 7),
                            Text("Quantity : ${e["Quantity"]}",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                          ],
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            IconButton(onPressed: () {
                              setState(() {
                                Global.g1.detaillist.remove(e);
                              });
                              }, icon: const Icon(Icons.delete_outline_sharp,color: Colors.red,))
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )).toList(),
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          Navigator.pushNamed(context,'detail');
        },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
