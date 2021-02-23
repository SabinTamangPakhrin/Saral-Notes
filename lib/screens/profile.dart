import 'package:flutter/material.dart';
import 'package:saral_notes/screens/login.dart';
import 'package:saral_notes/screens/setting.dart';
import 'package:saral_notes/screens/widgets/custom_button.dart';
import 'package:saral_notes/utils/authentication.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final auth = Authentication();
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(
                          'https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Willam Smith',
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(height: 5),
                          Text('Fashion Model',
                              style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                _logoutBtn(),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingScreen(),
                ),
              );
            },
          )
        ],
      ),
    );
  }

  Widget _logoutBtn() {
    return CustomButton(
      buttonTitle: 'Logout',
      loading: _loading,
      onTap: logout,
    );
  }

  logout() async {
    setState(() {
      _loading = true;
    });
    bool success = await auth.logout();
    if (success) {
      setState(() {
        _loading = false;
      });
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
      );
    } else {
      setState(() {
        _loading = false;
      });
      print('Logout Error');
    }
  }
}
