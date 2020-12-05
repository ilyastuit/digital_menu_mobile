import 'package:flutter/material.dart';
import 'package:meals/providers/Cart.dart';
import 'package:meals/widgets/badge.dart';
import 'package:meals/widgets/main_drawer.dart';
import 'package:provider/provider.dart';
import 'package:reviews_slider/reviews_slider.dart';

import 'cart_screen.dart';

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

  void _submitForm() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
        actions: [
          Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
              child: ch,
              value: cart.itemCount.toString(),
            ),
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.feedback_outlined,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(ReviewScreen.routeName);
            },
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: SingleChildScrollView(
        child: SafeArea(
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
                  onChange: onChange2,
                  initialValue: 1,),
              Text(selectedValue2.toString()),
              SizedBox(height: 20),
              Text(
                'Customer Service?',
                style: TextStyle(color: Color(0xFF6f7478), fontSize: 18),
              ),
              SizedBox(height: 20),
              ReviewSlider(
                  onChange: onChange3,
                  initialValue: 1,),
              Text(selectedValue3.toString()),
              RaisedButton(
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: _submitForm,
                child: Text('Submit Feedback'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
