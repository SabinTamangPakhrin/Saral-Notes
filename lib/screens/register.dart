import 'package:flutter/material.dart';
import 'package:saral_notes/screens/widgets/company_logo.dart';
import 'package:saral_notes/screens/widgets/custom_button.dart';
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
      body: body(),
    );
  }

  Widget _companyLogo() {
    return CompanyLogo(height: 140);
  }

  Widget body() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _companyLogo(),
            SizedBox(height: 20),
            _registerForm(),
          ],
        ),
      ),
    );
  }

  Widget _registerForm() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _nameTextField(),
              SizedBox(height: 20),
              _emailTextField(),
              SizedBox(height: 20),
              _passwordTextField(),
              SizedBox(height: 20),
              _confirmPasswordTextField(),
              SizedBox(height: 20),
              _signUpBtn(),
              SizedBox(height: 20),
              _signInText(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _nameTextField() {
    return TextFormField(
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
    );
  }

  Widget _emailTextField() {
    return TextFormField(
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
    );
  }

  Widget _passwordTextField() {
    return TextFormField(
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
    );
  }

  Widget _confirmPasswordTextField() {
    return TextFormField(
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
    );
  }

  Widget _signUpBtn() {
    return CustomButton(
      buttonTitle: 'SignUp',
      loading: _loading,
      onTap: signUp,
    );
  }

  _signInText() {
    return Row(
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
    );
  }

  void signUp() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        _loading = true;
      });
      bool success = await _auth.signUp(_emailC.text, _cpassC.text);
      if (success) {
        setState(() {
          _loading = false;
        });
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Successful'),
              content: Text('Successfully Registered'),
              actions: [
                MaterialButton(
                  child: Text('Go to Login'),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
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
        _scaffoldKey.currentState.showSnackBar(snackbar);
      }
    }
  }
}
