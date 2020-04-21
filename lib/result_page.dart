import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Your Result',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.only(left: 40, right: 40, bottom: 40),
              child: Container(
                width: double.infinity,
                color: Color(0xFF1D2033),
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'NORMAL',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.greenAccent),
                      ),
                      Text(
                        '22.1',
                        style: TextStyle(
                            fontSize: 90,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            letterSpacing: 2),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Normal BMI range:',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF464858)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '18 - 25 kg/m2',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'You have a healthy body weight. Good job',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              child: Center(
                child: Text(
                  'reCalculate your bmi'.toUpperCase(),
                  style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w400),
                ),
              ),
              color: Color(0xFFEA1556),
              margin: EdgeInsets.only(top: 5),
              height: 80,
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}
