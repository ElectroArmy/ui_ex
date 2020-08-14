import 'package:flutter/material.dart';

class UnLikeWidget extends StatefulWidget{
  @override
  _UnLikeWidgetState createState() => _UnLikeWidgetState();
}


class _UnLikeWidgetState extends State<UnLikeWidget> {
  //Fav8 widget State Build
  bool _isLiked = true;
  int _likeCount = 1;

  //Fav8 Wdiget State fields
  void _toggleLike() {
    setState(() {
      if (_isLiked) {
        _likeCount += 0;
        _isLiked = false;
      } else {
        _likeCount =- 1;
        _isLiked = true;
      }
    });
  }

  //Endof _toggleFav8
  
  //
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (_isLiked ? Icon(Icons.thumb_down) : Icon(Icons.thumb_up)),
            color: Colors.red[500],
            onPressed: _toggleLike,
          ),
        ),
        SizedBox(
          width: 18,
          child: Container(
            child: Text('$_likeCount'),
          ),
        ),
      ],
    );
  }
}