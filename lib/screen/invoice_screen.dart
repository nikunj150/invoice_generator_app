import 'package:flutter/material.dart';
import 'package:invoice_generator_app/utils/global_class.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtNumber = TextEditingController();
  TextEditingController txtProduct = TextEditingController();
  TextEditingController txtType = TextEditingController();
  TextEditingController txtQu = TextEditingController();
  TextEditingController txtPrice= TextEditingController();
  double total=0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: const Text("Invoice Generator",
                style: TextStyle(color: Colors.white)),
            centerTitle: true,
            actions: const [
              Icon(Icons.share, color: Colors.white),
              SizedBox(width: 20),
              Icon(
                Icons.library_add,
                color: Colors.white,
              ),
            ]),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: txtName,
                decoration: const InputDecoration(
                    hintText: "Customer Name",
                    ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: txtNumber,
                decoration: const InputDecoration(hintText: "Invoice No."),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: txtProduct,
                decoration: InputDecoration(
                    hintText: "Choose Product",
                    suffix: Icon(Icons.arrow_drop_down)),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: txtType,
                decoration: InputDecoration(hintText: "Type"),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  SizedBox(
                    width: 170,
                    child: TextField(
                      controller:txtQu,
                      decoration: InputDecoration(hintText: "Quantity"),
                    ),
                  ),
                  SizedBox(width: 30),
                  SizedBox(
                    width: 170,
                    child: TextField(
                      controller: txtPrice,
                      decoration: InputDecoration(hintText: "Amount"),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              InkWell(
                onTap: () {
                  setState(() {
                    total=double.parse(txtPrice.text)*
                    double.parse(txtQu.text);
                  });
                  Map m1={
                    "No" : txtNumber.text,
                    "Name" : txtName.text,
                    "Product" : txtProduct.text,
                    "Quantity" : txtQu.text,
                    "type" : txtType.text,
                    "amount" : txtPrice,
                    "total" : total,
                  };
                  Global.g1.detaillist.add(m1);
                  Navigator.pushNamed(context, 'manage').then((e) => {});

                },
                child: Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.25,
                  decoration: BoxDecoration(
                      color: Colors.blue, borderRadius: BorderRadius.circular(5)),
                  child: const Text("Submit",
                      style: TextStyle(color: Colors.white,fontSize: 18)),
                ),
              ),
              Divider(
                color: Colors.grey.shade300,
                height: 50,
              ),
              Text(
                "Total Payable:${total}",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
