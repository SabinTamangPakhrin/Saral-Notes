import 'package:flutter/material.dart';
import 'package:saral_notes/screens/widgets/company_logo.dart';
import 'package:saral_notes/screens/widgets/custom_button.dart';
import 'package:saral_notes/screens/register.dart';
import 'package:saral_notes/screens/widgets/bottomNav.dart';
import 'package:saral_notes/screens/widgets/custom_textfield.dart';
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

  CustomTextField _emailTextInputField;
  CustomTextField _passwordTextInputField;
  //to show loading status while performing login
  bool _loading = false;

  @override
  void initState() {
    _emailTextInputField = new CustomTextField(
      hintText: 'Email',
      icon: Icon(Icons.mail),
      inputType: TextInputType.emailAddress,
      showText: true,
      validator: formValidator.emailValidator,
      visibilityIcon: false,
      textInputAction: TextInputAction.next,
    );
    _passwordTextInputField = new CustomTextField(
      hintText: 'Password',
      icon: Icon(Icons.lock),
      inputType: TextInputType.emailAddress,
      showText: false,
      validator: formValidator.passwordValidator,
      visibilityIcon: true,
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
            _loginForm(),
          ],
        ),
      ),
    );
  }

  Widget _companyLogo() {
    return CompanyLogo(height: 150);
  }

  Widget _loginForm() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _emailTextInputField,
              SizedBox(height: 20),
              _passwordTextInputField,
              SizedBox(height: 10),
              _forgotPassword(),
              SizedBox(height: 20),
              _signInBtn(),
              SizedBox(height: 20),
              _divider(),
              SizedBox(height: 10),
              _socialSignIn(),
              SizedBox(height: 20),
              _signUpText(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _forgotPassword() {
    return Align(
      alignment: Alignment.centerRight,
      child: Text('Forgot Password?'),
    );
  }

  Widget _signInBtn() {
    return CustomButton(
      buttonTitle: 'Sign In',
      onTap: signIn,
      loading: _loading,
    );
  }

  Widget _socialSignIn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage('assets/icons/fbIcon.png'),
          ),
          onTap: () {
            final snackBar = SnackBar(
              content: Text('Facebook SignIn'),
            );
            _scaffoldKey.currentState.showSnackBar(snackBar);
          },
        ),
        SizedBox(width: 20),
        GestureDetector(
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage('assets/icons/googleIcon.png'),
          ),
          onTap: () {
            final snackBar = SnackBar(
              content: Text('Google SignIn'),
            );
            _scaffoldKey.currentState.showSnackBar(snackBar);
          },
        ),
      ],
    );
  }

  Widget _divider() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Divider(),
        Text('OR'),
      ],
    );
  }

  Widget _signUpText() {
    return Row(
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
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => RegisterScreen()));
          },
        ),
      ],
    );
  }

  void signIn() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        _loading = true;
      });
      bool success = await auth.signIn(
        _emailTextInputField.getText(),
        _passwordTextInputField.getText(),
      );
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
