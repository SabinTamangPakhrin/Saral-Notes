import 'package:flutter/material.dart';
import 'package:saral_notes/screens/login.dart';
import 'package:saral_notes/utils/authentication.dart';
import 'package:saral_notes/utils/validator.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final _formKey = GlobalKey<FormState>();

  final validator = Validator();

  final _auth = Authentication();

  TextEditingController _nameC = TextEditingController();

  TextEditingController _emailC = TextEditingController();

  TextEditingController _passC = TextEditingController();

  TextEditingController _cpassC = TextEditingController();

  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xffEFEFEF),
      body: SingleChildScrollView(
        child: Container(
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
                          controller: _nameC,
                          decoration: InputDecoration(
                            hintText: 'Full Name',
                            filled: true,
                            fillColor: Color(0xffEFEFEF),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(40),
                            ),
                            prefixIcon: Icon(Icons.person),
                            contentPadding: EdgeInsets.all(8),
                          ),
                          validator: validator.fNameValidator,
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: _emailC,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: 'Email',
                            filled: true,
                            fillColor: Color(0xffEFEFEF),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(40),
                            ),
                            prefixIcon: Icon(Icons.mail),
                            contentPadding: EdgeInsets.all(8),
                          ),
                          validator: validator.emailValidator,
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: _passC,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            filled: true,
                            fillColor: Color(0xffEFEFEF),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(40),
                            ),
                            prefixIcon: Icon(Icons.lock),
                            contentPadding: EdgeInsets.all(8),
                          ),
                          validator: validator.passwordValidator,
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: _cpassC,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Confirm Password',
                            filled: true,
                            fillColor: Color(0xffEFEFEF),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(40),
                            ),
                            prefixIcon: Icon(Icons.verified_user),
                            contentPadding: EdgeInsets.all(8),
                          ),
                          validator: (value) {
                            if (value != _passC.text) {
                              return 'Password doesnot matched.';
                            }
                            return null;
                          },
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
                            child: _loading
                                ? Text('Loading....')
                                : Text('Sign Up'),
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                setState(() {
                                  _loading = true;
                                });
                                bool success = await _auth.signUp(
                                    _emailC.text, _cpassC.text);
                                if (success) {
                                  setState(() {
                                    _loading = false;
                                  });
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text('Successful'),
                                        content:
                                            Text('Successfully Registered'),
                                        actions: [
                                          MaterialButton(
                                            child: Text('Go to Login'),
                                            onPressed: () {
                                              Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      LoginScreen(),
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                } else {
                                  setState(() {
                                    _loading = false;
                                  });
                                  final snackbar = SnackBar(
                                    content: Text('Registration Error'),
                                  );
                                  _scaffoldKey.currentState
                                      .showSnackBar(snackbar);
                                }
                              }
                            },
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Already have an account?'),
                            SizedBox(width: 5),
                            InkWell(
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                  color: Color(0xff003893),
                                ),
                              ),
                              onTap: () {
                                Navigator.pop(context);
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
      ),
    );
  }
}
