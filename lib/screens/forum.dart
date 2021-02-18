import 'package:flutter/material.dart';
import 'package:saral_notes/models/forum.dart';

class ForumScreen extends StatelessWidget {
  final forumList = Forum().getForum();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forum'),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: forumList.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                CircleAvatar(),
                                SizedBox(width: 5),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(forumList[index].creator),
                                    Text(
                                      forumList[index].timestamp,
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Icon(Icons.star, color: Colors.orange),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        forumList[index].title,
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff003893),
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(forumList[index].post),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon:
                                Icon(Icons.favorite, color: Color(0xffDC143C)),
                            onPressed: () {},
                          ),
                          IconButton(icon: Icon(Icons.share), onPressed: () {}),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.message),
        onPressed: () {},
      ),
    );
  }
}
