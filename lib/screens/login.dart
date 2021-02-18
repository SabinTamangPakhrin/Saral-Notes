import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saral_notes/provider/user_provider.dart';
import 'package:saral_notes/screens/register.dart';
import 'package:saral_notes/screens/widgets/bottomNav.dart';
import 'package:saral_notes/utils/authentication.dart';
import 'package:saral_notes/utils/validator.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //for validating all the form field at once
  final _formKey = GlobalKey<FormState>();

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  //object for validating each form field
  final formValidator = Validator();

  final auth = Authentication();

  TextEditingController _emailC = TextEditingController();

  TextEditingController _passC = TextEditingController();

  //to show loading status while performing login
  bool _loading = false;

  //for password visibility
  bool hidden = true;

  @override
  Widget build(BuildContext context) {
    print(Provider.of<UserProvider>(context).getUserName());
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
                            prefixIcon: Icon(Icons.person),
                            contentPadding: EdgeInsets.all(8),
                          ),
                          validator: formValidator.emailValidator,
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: _passC,
                          obscureText: hidden,
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
                            suffixIcon: IconButton(
                              icon: Icon(
                                hidden
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                size: 20,
                              ),
                              onPressed: () {
                                setState(() {
                                  hidden = !hidden;
                                });
                              },
                            ),
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
                            child:
                                _loading ? Text('Loading...') : Text('Sign In'),
                            onPressed: _loading ? null : signIn,
                          ),
                        ),
                        SizedBox(height: 20),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Divider(),
                            Text('OR'),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              child: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                backgroundImage:
                                    AssetImage('assets/icons/fbIcon.png'),
                              ),
                              onTap: () {
                                final snackBar = SnackBar(
                                  content: Text('Facebook SignIn'),
                                );
                                _scaffoldKey.currentState
                                    .showSnackBar(snackBar);
                              },
                            ),
                            SizedBox(width: 20),
                            GestureDetector(
                              child: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                backgroundImage:
                                    AssetImage('assets/icons/googleIcon.png'),
                              ),
                              onTap: () {
                                final snackBar = SnackBar(
                                  content: Text('Google SignIn'),
                                );
                                _scaffoldKey.currentState
                                    .showSnackBar(snackBar);
                              },
                            ),
                          ],
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
                                        builder: (context) =>
                                            RegisterScreen()));
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

  void signIn() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        _loading = true;
      });
      bool success = await auth.signIn(_emailC.text, _passC.text);
      if (success) {
        setState(() {
          _loading = false;
        });
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => BottomNav(),
          ),
        );
      } else {
        setState(() {
          _loading = false;
        });
        print('Login Error');
      }
    }
  }
}
