import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:saral_notes/screens/forum.dart';
import 'package:saral_notes/screens/login.dart';
import 'package:saral_notes/screens/notes.dart';
import 'package:saral_notes/screens/profile.dart';
import 'package:saral_notes/screens/register.dart';
import 'package:saral_notes/screens/widgets/bottomNav.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Saral Notes',
      theme: appTheme(),
      home: FutureBuilder(
        future: _fbApp,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Text('You have an Error! ${snapshot.error.toString()}');
          } else if (snapshot.hasData) {
            return LoginScreen();
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      routes: appRoutes(),
    );
  }

  ThemeData appTheme() {
    return ThemeData(
      primaryColor: Color(0xff003893),
      fontFamily: 'Raleway',
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }

  Map<String, Widget Function(BuildContext)> appRoutes() {
    return {
      '/master': (context) => BottomNav(),
      '/login': (context) => LoginScreen(),
      '/register': (context) => RegisterScreen(),
      '/note': (context) => NotesScreen(),
      '/forum': (context) => ForumScreen(),
      '/profile': (context) => ProfileScreen(),
    };
  }
}
