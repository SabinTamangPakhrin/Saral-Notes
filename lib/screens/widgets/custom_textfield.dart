import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField({
    this.textEditingController,
    this.hintText,
    this.inputType,
    this.icon,
    this.validator,
    this.showText = false,
  });

  final TextEditingController textEditingController;
  final String hintText;
  final TextInputType inputType;
  final Icon icon;
  final Function validator;
  final bool showText;
  final _CustomTextFieldState _customTextFieldState =
      new _CustomTextFieldState();
  String getText() => _customTextFieldState.getText();

  @override
  _CustomTextFieldState createState() => _customTextFieldState;
}

class _CustomTextFieldState extends State<CustomTextField> {
  TextEditingController textEditingController = new TextEditingController();
  String getText() => textEditingController.text;
  bool hidden = true;

  @override
  Widget build(BuildContext context) {
    return widget.showText ? _normalTextField() : _passwordTextField();
  }

  Widget _normalTextField() {
    return TextFormField(
      controller: textEditingController,
      textInputAction: TextInputAction.next,
      keyboardType: widget.inputType,
      decoration: InputDecoration(
        hintText: widget.hintText,
        filled: true,
        fillColor: Color(0xffEFEFEF),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(40),
        ),
        prefixIcon: widget.icon,
        contentPadding: EdgeInsets.all(8),
      ),
      validator: widget.validator,
    );
  }

  Widget _passwordTextField() {
    return TextFormField(
      obscureText: hidden,
      controller: textEditingController,
      keyboardType: widget.inputType,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        hintText: widget.hintText,
        filled: true,
        fillColor: Color(0xffEFEFEF),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(40),
        ),
        prefixIcon: widget.icon,
        suffixIcon: IconButton(
          icon: Icon(
            hidden ? Icons.visibility : Icons.visibility_off,
            size: 20,
          ),
          onPressed: () {
            setState(() {
              hidden = !hidden;
            });
          },
        ),
        contentPadding: EdgeInsets.all(8),
      ),
      validator: widget.validator,
    );
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }
}
