import 'package:flutter/material.dart';
import 'package:reviews_slider/reviews_slider.dart';

class ReviewScreen extends StatefulWidget {
  static const String routeName = '/feedback';
  @override
  _ReviewScreenState createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  int selectedValue1;
  int selectedValue2;
  int selectedValue3;

  void onChange1(int value) {
    setState(() {
      selectedValue1 = value;
    });
  }

  void onChange2(int value) {
    setState(() {
      selectedValue2 = value;
    });
  }

  void onChange3(int value) {
    setState(() {
      selectedValue3 = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Meal quality?',
              style: TextStyle(color: Color(0xFF6f7478), fontSize: 18),
            ),
            SizedBox(height: 20),
            ReviewSlider(
              onChange: onChange1,
            ),
            Text(selectedValue1.toString()),
            SizedBox(height: 20),
            Text(
              'Price?',
              style: TextStyle(color: Color(0xFF6f7478), fontSize: 18),
            ),
            SizedBox(height: 20),
            ReviewSlider(
                optionStyle: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
                onChange: onChange2,
                initialValue: 1,
                options: ['Terrible', 'Bad', 'OK', 'Good', 'Excellent']),
            Text(selectedValue2.toString()),
            SizedBox(height: 20),
            Text(
              'Customer Service?',
              style: TextStyle(color: Color(0xFF6f7478), fontSize: 18),
            ),
            SizedBox(height: 20),
            ReviewSlider(
                optionStyle: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
                onChange: onChange3,
                initialValue: 1,
                options: ['Terrible', 'Bad', 'OK', 'Good', 'Excellent']),
            Text(selectedValue3.toString()),
          ],
        ),
      ),
    );
  }
}
