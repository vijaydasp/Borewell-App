import 'package:borwell_app/ipaddress_page.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: IpAddressInputPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
