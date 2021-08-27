import 'package:bmi_calculator/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'input_page.dart';
import 'dart:math';
int power = pow(10,4);
class ResultsPage extends StatelessWidget {
  double calculate(int a,int b) {
    double result = (power*a)/(b*b);
    return result;

  }
  double category = (power*weight)/(height*height);

  String label = 'OVERWEIGHT';
  String feedback = 'You have a higher than normal body weight. Try to exercise more';
  String finalise(double c) {
    if(c<18.5) {
      label = 'UNDERWEIGHT';
    }
    else if (c>=18.5 && c<24.9) {
      label = 'HEALTHY WEIGHT';
    }
    else if (c>=24.9 && c<29.9) {
      label = 'OVERWEIGHT';
    }
    else if (c>=29.9 && c<35) {
      label = 'MODERATELY OBESE';
    }
    else {
      label = 'SEVERELY OBESE';
    }
    return label;
  }
  String feedbackFinalise(double d) {
    if(d<18.5) {
      feedback = 'You have a lower than normal body weight which implies Malnutrition risk. Try to improve your diet ';
    }
    else if (d>=18.5 && d<24.9) {
      feedback = 'You have a perfect body weight which implies low risk.Maintain the same for a long period of time';
    }
    else if (d>=24.9 && d<29.9) {
      feedback = 'You have a higher than normal body weight which implies Enhanced Risk. Try to exercise more';
    }
    else if (d>=29.9 && d<35) {
      feedback = 'You have a high body weight which implies Medium Risk. Keep Working on your fitness and diet routines';
    }
    else {
      feedback = 'You have a very high body weight which implies High Risk. Work on your fitness and take immediate care of your health ';
    }
    return feedback;

  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0E21),
      appBar: AppBar(
        titleSpacing: 70,
        title: Text(
          'BMI CALCULATOR',
        ),
      ),
      body:Column(

        children:[
          Center(
            child: Text('YOUR RESULT',
            style: TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.w900,
            ),),
          ),
          SizedBox(height: 30),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top:20),
              color:Color(0xFF101E33),
              height:80,
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Text(
                      finalise(category),
                    style: TextStyle(
                      fontSize: 24,
                      color:Colors.green
                    ),),
                  ),
                  SizedBox(height: 100.0),
    // double result = num.parse(calculate(weight,height).toStringAsFixed(2));
                  Center(
                    child: Text(
                        num.parse(calculate(weight,height).toStringAsFixed(2)).toString(),
                      style:TextStyle(
                        fontSize: 60.0,
                        fontWeight: FontWeight.w900,
                      ),

                    ),
                  ),

                ],
              )
            ),
          ),
          SizedBox(height:40),
          Text(
            feedbackFinalise(category),
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,

            ),
          ),
          SizedBox(height:50),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => InputPage()));
            },
            child: Container(
              child:Center(child: Text('RE-CALCULATE',style: TextStyle(
                fontSize: 26,
                color: Colors.white,
              ),),),
              color:kBottomContainerColour,
              margin:EdgeInsets.only(top:10.0),
              width:double.infinity,
              height:kBottomContainerHeight,

            ),
          ),

        ]

      )
    );
  }
}
