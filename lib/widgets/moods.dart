import 'package:flutter/material.dart';

class Moods extends StatefulWidget {
  @override
  _MoodsState createState() => _MoodsState();
}

class _MoodsState extends State<Moods> {
  List<bool> isSelected = List.generate(5, (_) => false);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ToggleButtons(
        selectedBorderColor: Colors.purple,
        renderBorder: false,
        fillColor: Colors.transparent,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Icon(Icons.sentiment_very_dissatisfied, size: 36),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Icon(Icons.sentiment_dissatisfied, size: 36),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Icon(Icons.sentiment_neutral, size: 36),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Icon(Icons.sentiment_satisfied, size: 36),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Icon(Icons.sentiment_very_satisfied, size: 36),
          ),
        ],
        isSelected: isSelected,
        onPressed: (int index) {
          setState(() {
            isSelected[index] = !isSelected[index];
          });
        },
      ),
    );
  }
}
