import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    this.buttonTitle,
    this.onTap,
    this.loading,
  });

  final String buttonTitle;
  final Function onTap;
  final bool loading;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 150,
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        color: Color(0xffDC143C),
        textColor: Colors.white,
        child: loading ? Text('Loading...') : Text(buttonTitle),
        onPressed: loading ? null : onTap,
      ),
    );
  }
}
