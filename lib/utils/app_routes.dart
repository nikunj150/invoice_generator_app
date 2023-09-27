import 'package:flutter/cupertino.dart';
import 'package:invoice_generator_app/screen/pdf_screen.dart';
import 'package:invoice_generator_app/screen/invoice_screen.dart';
import 'package:invoice_generator_app/screen/manage_screen.dart';
import 'package:invoice_generator_app/screen/splesh_screen.dart';

Map<String,WidgetBuilder> screenroutes ={

  '/':(context) => SpleshScreen(),
  'manage' :(context) => ManageScreen(),
  'detail' : (context) => DetailScreen(),
  'pdf': (context) => PdfScreen(),
};