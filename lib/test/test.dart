import 'package:flutter/material.dart';

class MyAnimatedContainerWithText extends StatefulWidget {
  @override
  _MyAnimatedContainerWithTextState createState() =>
      _MyAnimatedContainerWithTextState();
}

class _MyAnimatedContainerWithTextState
    extends State<MyAnimatedContainerWithText> {
  bool _isExpanded = false;
  double _height = 100.0;
  double _width = 100.0;
  String _text = 'Hello World!';

  void _toggleExpansion() {
    setState(() {
      _isExpanded = !_isExpanded;
      _height = _isExpanded ? 200.0 : 100.0;
      _width = _isExpanded ? 200.0 : 100.0;
      _text = _isExpanded ? 'Hello World!\nThis is a long text' : 'Hello World!';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedContainer with Text Example'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: _toggleExpansion,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            height: _height,
            width: _width,
            color: Colors.green,
            child: Center(
              child: FittedBox(
                child: Text(
                  _text,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

