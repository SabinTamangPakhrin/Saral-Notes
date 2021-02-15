import 'package:flutter/material.dart';
import 'package:saral_notes/screens/widget/subjectTab.dart';

class SubjectScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        top: true,
        left: true,
        right: true,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Subject',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 5),
                      RichText(
                        text: TextSpan(
                          text: 'Today\'s math progress\t\t',
                          style: TextStyle(
                              color: Colors.grey, fontFamily: 'Raleway'),
                          children: [
                            TextSpan(
                              text: '0 min',
                              style: TextStyle(
                                color: Color(0xff003893),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(Icons.app_registration),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            SubjectTabView(),
            
          ],
        ),
      ),
    );
  }
}
