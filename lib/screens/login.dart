import 'package:flutter/material.dart';
import 'package:saral_notes/screens/register.dart';
import 'package:saral_notes/utils/validator.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final formValidator = Validator();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEFEFEF),
      body: Container(
        padding: EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/snLogo.png',
              height: 150,
            ),
            SizedBox(height: 20),
            Card(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          filled: true,
                          fillColor: Color(0xffEFEFEF),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(40),
                          ),
                          prefixIcon: Icon(Icons.person),
                          contentPadding: EdgeInsets.all(8),
                        ),
                        validator: formValidator.emailValidator,
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          fillColor: Color(0xffEFEFEF),
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(40),
                          ),
                          prefixIcon: Icon(Icons.lock),
                          contentPadding: EdgeInsets.all(8),
                        ),
                        validator: formValidator.passwordValidator,
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text('Forgot Password?'),
                      ),
                      SizedBox(height: 20),
                      Container(
                        height: 45,
                        width: 150,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                          color: Color(0xffDC143C),
                          textColor: Colors.white,
                          child: Text('Sign In'),
                          onPressed: () {
                            _formKey.currentState.validate();
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Don\'t have an account?'),
                          SizedBox(width: 5),
                          InkWell(
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                color: Color(0xff003893),
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegisterScreen()));
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
