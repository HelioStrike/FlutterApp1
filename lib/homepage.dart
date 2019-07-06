import 'package:flutter/material.dart';
import 'aboutus.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Widget TaskTile(String task, Color color, String image) {
    return GestureDetector(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AboutUs()),
          );
        },
        child:Stack(
          children: <Widget>[
            Container(
              decoration: new BoxDecoration(
                gradient: LinearGradient(
                  begin: FractionalOffset.topLeft,
                  end: FractionalOffset.bottomRight,
                  colors: [color.withOpacity(0.9), color.withOpacity(0.7)], 
                ),
                boxShadow: [
                  new BoxShadow(
                    color: Colors.black38,
                    offset: new Offset(2.0, 2.0),
                    blurRadius: 5.0,
                  )
                ],
                borderRadius: new BorderRadius.all(Radius.circular(5.0)),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                  colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.dstATop),
                ),              
              ),
              child: Text(
                task,
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.white,
                ),
              ),
              height: 80.0,
              width: double.infinity,
              padding: EdgeInsets.all(8.0),
              margin: EdgeInsets.all(8.0),
            ),
          Positioned.fill(
            child: Container(
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.arrow_forward,
                color: Colors.white,
                size: 40.0,
              ),
              margin: EdgeInsets.all(20.0),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    List<String> tasks = <String>['Search Cartoons', 'Top Cartoons', 'New & Rising', 'About me']; 
    List<Color> tileColors = <Color>[Colors.blue, Colors.red, Colors.green, Colors.black];
    List<String> imagePaths = <String>['images/pokemon.png', 'images/avatar.jpg', 'images/finalspace.jpg', 'images/southparknerd.jpg'];

    List<Widget> taskTiles = <Widget>[];
    for (var t = 0; t < tasks.length; t++) {
      taskTiles.add(TaskTile(tasks[t], tileColors[t], imagePaths[t]));
    }

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: ListView(
        children: taskTiles,
        padding: EdgeInsets.all(5.0),
      ),
    );
  }
}
