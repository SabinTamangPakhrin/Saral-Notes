import 'package:flutter/material.dart';

class CompanyLogo extends StatelessWidget {
  CompanyLogo({this.height});
  final double height;  
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/snLogo.png',
      height: height,
    );
  }
}
