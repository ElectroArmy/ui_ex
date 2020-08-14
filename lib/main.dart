import 'package:flutter/material.dart';
import 'package:ui_ex/drawer/draw.dart';
import 'package:ui_ex/isolate/homepage.dart';
import 'package:ui_ex/support/unlike.dart';

void main() {runApp(MyApp());
}

// void main() {
//   runApp(MaterialApp(
//     home: HomePage(),
//   ));
// }

class MyApp extends StatelessWidget {
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          
          Expanded(

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom:8),
                  child: Text(
                    "Hi Poe Poe",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'How Are You Babe?',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          Fav8Widget(),
          
          // LikeWidget(),
          //Added for Fav8 Widget
        ],
      ),
    );
    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(color, Icons.call, 'Call'),
          //Invoke Like Widget here
          LikeWidget(),
          //Invoke Unlike Widget
          UnLikeWidget(),
          //NavDraw
          _buildButtonColumn(color, Icons.near_me, 'Route'),
          _buildButtonColumn(color, Icons.share, 'Share'),
        ],
      ),
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
            'Alps. Situated 1,578 meters above sea level, it is one of the '
            'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
            'half-hour walk through pastures and pine forest, leads you to the '
            'lake, which warms to 20 degrees Celsius in the summer. Activities '
            'enjoyed here include rowing, and riding the summer toboggan run.',
            softWrap: true,
      ),
    );
    Widget text1Section = Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
            'Alps. Situated 1,578 meters above sea level, it is one of the '
            'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
            'half-hour walk through pastures and pine forest, leads you to the '
            'lake, which warms to 20 degrees Celsius in the summer. Activities '
            'enjoyed here include rowing, and riding the summer toboggan run.',
            softWrap: true,
      ),
    );

    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text('The World Changes @ life'),
        ),
        body: ListView(
          children: [
            Image.asset(
              'images/p6.JPG',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            //Call the Sections here to view 
            titleSection,
            buttonSection,
            textSection,
            text1Section,
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => NavigationDrawer()) ),
        ),
      ),
      
    );
    
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
        // LikeWidget(),
      ],
    );
  }
}

// The class of Fav8 start rhs
class Fav8Widget extends StatefulWidget{
  @override
  _Fav8WidgetState createState() => _Fav8WidgetState();
}


class _Fav8WidgetState extends State<Fav8Widget> {
  //Fav8 widget State Build
  bool _isFavorited = true;
  int _favoriteCount = 41;

  //Fav8 Wdiget State fields
  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
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
            icon: (_isFavorited ? Icon(Icons.star) : Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 18,
          child: Container(
            child: Text('$_favoriteCount'),
          ),
        ),
      ],
    );
  }
}

// The class of Liked . unliked on support dir
class LikeWidget extends StatefulWidget{
  @override
  _LikeWidgetState createState() => _LikeWidgetState();
}


class _LikeWidgetState extends State<LikeWidget> {
  //Fav8 widget State Build
  bool _isLiked = true;
  int _likeCount = 0;

  //Fav8 Wdiget State fields
  void _toggleLike() {
    setState(() {
      if (_isLiked) {
        _likeCount -= 0;
        _isLiked = false;
      } else {
        _likeCount += 1;
        _isLiked = true;
      }
    });
  }

//Endof _toggleFav8
  
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (_isLiked ? Icon(Icons.thumb_up) : Icon(Icons.thumb_up)),
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
