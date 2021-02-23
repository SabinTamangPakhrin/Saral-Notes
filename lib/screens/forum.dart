import 'package:flutter/material.dart';
import 'package:saral_notes/models/forum.dart';
import 'package:saral_notes/screens/widgets/each_fourm.dart';

class ForumScreen extends StatelessWidget {  
  final forumList = Forum().getForum();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: body(),
      floatingActionButton: composeBtn(),
    );
  }

  Widget appBar() {
    return AppBar(
      title: Text('Forum'),
    );
  }

  Widget body() {
    return Container(
      child: ListView.builder(
        itemCount: forumList.length,
        itemBuilder: (context, index) {
          return EachForum(forumList[index]);
        },
      ),
    );
  }

  Widget composeBtn() {
    return FloatingActionButton(
      child: Icon(Icons.message),
      onPressed: () {},
    );
  }
}
