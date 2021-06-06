import 'package:flutter/material.dart';
import 'constants.dart';
import 'my_widgets.dart';

class ResultsPage extends StatelessWidget {
  final String bmi;
  final String result;
  final String interpretation;

  ResultsPage({@required this.bmi,@required this.interpretation,@required this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculation"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              child: Center(
                child: Text(
                  'Your Result',
                  style: kLabelTextStyleTitle,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              cardColor: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    result.toUpperCase(),
                    style: TextStyle(
                        color: Color(0xFF24D876),
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding: EdgeInsets.all(12),
                    child: Text(
                      '$bmi',
                      style:
                          TextStyle(fontSize: 100, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Column(
                    children: [
                      Text('Normal BMI Range',style: kLabelTextStyle,),
                      SizedBox(height: 8,),
                      Text('18.5 - 25 Kg/m2',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text('$interpretation',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22
                    ),),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: ()
            {
              Navigator.pop(context);
            },
            child: Container(
              margin: EdgeInsets.only(top: 16),
              width: double.infinity,
              color: kBottomContainerColor,
              height: kBottomContainerHeight,
              child: Center(
                child: Text(
                  'Re Calculate',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
