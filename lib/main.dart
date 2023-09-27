import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:invoice_generator_app/utils/app_routes.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.blue.shade700));
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: screenroutes,
    ),
  );
}
