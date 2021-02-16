import 'package:flutter/material.dart';
import 'package:saral_notes/screens/login.dart';
import 'package:saral_notes/utils/authentication.dart';

class ProfileScreen extends StatelessWidget {
  final auth = Authentication();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Profile Screen'),
          SizedBox(height: 20),
          RaisedButton(
            child: Text('Logout'),
            color: Color(0xffDC143C),
            textColor: Colors.white,
            onPressed: () async {
              bool success = await auth.logout();
              if (success) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                );
              } else {
                print('Error while logging out');
              }
            },
          ),
        ],
      ),
    );
  }
}
