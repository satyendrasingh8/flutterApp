
import 'package:flutter/material.dart';

class MesssageBubble extends StatelessWidget {
  final String message;
  final bool isMe;
  final Key key;
  final String username;
  final String userImage;
  MesssageBubble(this.message, this.username,this.userImage ,this.isMe, {this.key});
  @override
  Widget build(BuildContext context) {
    return Stack(
          children: [
            
            Row(
        mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: isMe ? Colors.grey[300] : Theme.of(context).accentColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomLeft: !isMe ? Radius.circular(0) : Radius.circular(12),
                bottomRight: isMe ? Radius.circular(0) : Radius.circular(12),
              ),
            ),
            width: 140,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            margin: EdgeInsets.symmetric(vertical: 14, horizontal: 6),
            child: Column(
              crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start ,
              children: [
                       Text(
                        username,
                        style: TextStyle(fontWeight: FontWeight.bold,
                         color: isMe
                          ? Colors.black
                          : Theme.of(context).accentTextTheme.headline1.color,
                          
                          ),
                          textAlign: isMe ? TextAlign.end : TextAlign.start,
                      
                    ),
                Text(
                  message,
                  style: TextStyle(
                      color: isMe
                          ? Colors.black
                          : Theme.of(context).accentTextTheme.headline1.color,
                      fontSize: 17),
                ),
              ],
            ),
          ),
        ],
      ),
      Positioned(
        top: 0,
        left: isMe ? null : 126,
        right:isMe ? 126:null,
        child: CircleAvatar(
          backgroundImage: NetworkImage(userImage),
        )
        
        ),
      ],
      overflow: Overflow.visible,

    );
  }
}
