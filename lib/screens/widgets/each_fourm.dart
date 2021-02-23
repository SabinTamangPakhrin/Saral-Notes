import 'package:flutter/material.dart';
import 'package:saral_notes/models/forum.dart';

class EachForum extends StatelessWidget {
  EachForum(this.forum);
  final Forum forum;
  @override
  Widget build(BuildContext context) {
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
                        CircleAvatar(
                          backgroundImage: NetworkImage(forum.creatorImg),
                        ),
                        SizedBox(width: 5),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(forum.creator),
                            Text(
                              forum.timestamp,
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
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
                forum.title,
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff003893),
                ),
              ),
              SizedBox(height: 5),
              Text(forum.post),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Icon(Icons.favorite, color: Color(0xffDC143C)),
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
  }
}
