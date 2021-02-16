import 'package:flutter/material.dart';

class NotesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        top: true,
        left: true,
        right: true,
        child: Column(
          children: [
            Text('Saral Notes')
          ],
        ),
      ),
    );
  }
}
