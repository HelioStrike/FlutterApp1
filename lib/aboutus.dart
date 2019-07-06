import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('About me'),
      ),
      body: Column(
          children: <Widget> [
          Container(
            child: CustomPaint(
              painter: Sky(),
            ),
            width: double.infinity,
            height: 0,
          ),
          Container(
            child: Center(          
              child: Container(
                alignment: Alignment.center,
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/southparknerd.jpg'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  border: Border.all(
                    color: Colors.white,
                    width: 4.0,
                  ),
                ),
              ),
            ),
            width: double.infinity,
            height: 200.0,
          ),
          Text(
            'About me',
            style: TextStyle(
              fontFamily: 'RobotoMono',
              fontSize:24.0,
              fontWeight: FontWeight.bold
            ),
          ),
          Text(
            'I\'m a developer :D'
          ),
        ],
      ),
    );
  }
}

class Sky extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Rect.fromPoints(Offset(0.0, 0.0), Offset(500.0, 100.0));    
    var gradient = LinearGradient(
      colors: [Colors.amber.withOpacity(0.9), Colors.amber.withOpacity(0.8)], 
    );

    canvas.drawRect(
      rect,
      Paint()..shader = gradient.createShader(rect),
    );
  }

  @override
  SemanticsBuilderCallback get semanticsBuilder {
    return (Size size) {
      
    };
  }

  @override
  bool shouldRepaint(Sky oldDelegate) => false;
  @override
  bool shouldRebuildSemantics(Sky oldDelegate) => false;
}