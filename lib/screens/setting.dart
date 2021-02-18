import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  static const List<String> universities = [
    'Tribhuvan University',
    'Pokhara University',
    'Kathmandu University',
    'Purbanchal University',
    'National Education Board',
    'CTEVT',
    'Mid Western University',
    'Far Western University',
    'Agriculture and Forestry University',
    'Nepal Sanskrit University',
  ];
  String uniSpinerValue = universities[0];

  static const List<String> courses = ['Bsc. CSIT', 'BIM', 'BCA', 'MBS', 'BBS'];
  String courseSpinnerValue = courses[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Setting')),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Change Faculty',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            DropdownButton(              
              value: uniSpinerValue,
              items: universities.map((uni) {
                return DropdownMenuItem(
                  child: Text(
                    uni,
                    overflow: TextOverflow.ellipsis,
                  ),
                  value: uni,
                );
              }).toList(),
              onChanged: (selectedUni) {
                setState(
                  () {
                    uniSpinerValue = selectedUni;
                  },
                );
              },
            ),
            DropdownButton(
              value: courseSpinnerValue,
              items: courses.map((course) {
                return DropdownMenuItem(
                  child: Text(
                    course,
                    overflow: TextOverflow.ellipsis,
                  ),
                  value: course,
                );
              }).toList(),
              onChanged: (selectedCourse) {
                setState(
                  () {
                    courseSpinnerValue = selectedCourse;
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
