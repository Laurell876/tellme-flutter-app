import 'package:flutter/material.dart';
import './Models/Question.dart';

class QuestionCard extends StatelessWidget {
  final Question question;

  QuestionCard(this.question);


  @override
  Widget build(BuildContext context) {
    var createdDate = DateTime.parse(question.created_at);
    var timeDiff = DateTime.now().difference(createdDate);
    var timeDiffToDisplay = timeDiff.inMinutes > 60 ? timeDiff.inHours >24 ? "${timeDiff.inDays} days ago" : "${timeDiff.inHours} hours ago" : "${timeDiff.inMinutes}  minutes ago";
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(this.question.title,
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600
        ),
      ),
      SizedBox(height: 5),
      Text(this.question.description),
      SizedBox(height: 5),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FlatButton(
            color: Colors.black,
            textColor: Colors.white,
            disabledColor: Colors.grey,
            disabledTextColor: Colors.black,
            padding: EdgeInsets.all(8.0),
            splashColor: Colors.white10,
            onPressed: () {
              /*...*/
            },
            child: Text(
              "View Question",
              style: TextStyle(fontSize: 15.0),
            ),
          ),

          Text(timeDiffToDisplay,
            style: TextStyle(
              fontSize: 14
            ),
          )
        ],
      ),
      Divider(),
      SizedBox(height: 30),
    ]);
  }
}
