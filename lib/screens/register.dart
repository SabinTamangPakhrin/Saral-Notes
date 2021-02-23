import 'package:flutter/material.dart';
import 'package:saral_notes/screens/widgets/company_logo.dart';
import 'package:saral_notes/screens/widgets/custom_button.dart';
import 'package:saral_notes/screens/login.dart';
import 'package:saral_notes/screens/widgets/custom_textfield.dart';
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

  bool _loading = false;

  //decalting custom textfields
  CustomTextField _nameTextField;
  CustomTextField _emailTextField;
  CustomTextField _passwordTextField;
  CustomTextField _confirmPasswordTextField;

  @override
  void initState() {
    //initializing name, email, password and confirm password Textfield
    _nameTextField = new CustomTextField(
      hintText: 'Full Name',
      icon: Icon(Icons.person),
      inputType: TextInputType.emailAddress,
      showText: true,
      validator: validator.fNameValidator,
      visibilityIcon: false,
      textInputAction: TextInputAction.next,
    );
    _emailTextField = new CustomTextField(
      hintText: 'Email',
      icon: Icon(Icons.mail),
      inputType: TextInputType.emailAddress,
      showText: true,
      validator: validator.emailValidator,
      visibilityIcon: false,
      textInputAction: TextInputAction.next,
    );
    _passwordTextField = new CustomTextField(
      hintText: 'Password',
      icon: Icon(Icons.lock),
      inputType: TextInputType.emailAddress,
      showText: false,
      validator: validator.passwordValidator,
      visibilityIcon: false,
      textInputAction: TextInputAction.next,
    );
    _confirmPasswordTextField = new CustomTextField(
      hintText: 'Confirm Password',
      icon: Icon(Icons.verified_user_sharp),
      inputType: TextInputType.emailAddress,
      showText: false,
      validator: (value) {
        if (value != _passwordTextField.getText()) {
          return 'Password doesnot matched.';
        }
        return null;
      },
      visibilityIcon: false,
      textInputAction: TextInputAction.done,
    );
    super.initState();
  }

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
              _nameTextField,
              SizedBox(height: 20),
              _emailTextField,
              SizedBox(height: 20),
              _passwordTextField,
              SizedBox(height: 20),
              _confirmPasswordTextField,
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

  Widget _signUpBtn() {
    return CustomButton(
      buttonTitle: 'Sign Up',
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
      bool success = await _auth.signUp(
          _emailTextField.getText(), _confirmPasswordTextField.getText());
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
