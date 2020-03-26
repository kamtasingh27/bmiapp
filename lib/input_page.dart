import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'inside_card.dart';
import 'reusable_card.dart';
import 'result.dart';
import 'bottom_button.dart';
import 'calc_brain.dart';

const inactiveCardColor = Colors.red;
const activeCardColor = Colors.deepOrange;

enum Gender
{
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  int height = 180;
  int weight = 60;
  int age = 20;

  Color maleCardColor = inactiveCardColor;
  Color femaleCardColor = inactiveCardColor;

  void updateColor(Gender selectedGender)
  {
    if(selectedGender == Gender.male)
      {
        if(maleCardColor == inactiveCardColor)
          {
            maleCardColor = activeCardColor;
            femaleCardColor = inactiveCardColor;
          }
        else
          {
            maleCardColor = inactiveCardColor;
          }
      }
    if(selectedGender == Gender.female)
      {
        if(femaleCardColor == inactiveCardColor)
          {
            femaleCardColor = activeCardColor;
            maleCardColor = inactiveCardColor;
          }
        else
          {
            femaleCardColor = inactiveCardColor;
          }
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        updateColor(Gender.male);
                      });
                    },
                    child: reusableCard(
                      clr : maleCardColor,
                      cardChild: insidecard(icon: FontAwesomeIcons.mars, txt: 'MALE'),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        updateColor(Gender.female);
                      });
                    },
                    child: reusableCard(
                      clr : femaleCardColor,
                      cardChild: insidecard(icon: FontAwesomeIcons.venus, txt: 'FEMALE'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: reusableCard(
              clr : inactiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        'cm',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 120,
                    max: 220,
                    activeColor: Colors.black,
                    inactiveColor: Colors.black12,
                    onChanged: (double newValue){
                      setState(() {
                        height = newValue.floor();
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: reusableCard(
                    clr : inactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          weight.toString(),
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FloatingActionButton(
                              heroTag: 'Fab1',
                              backgroundColor: Colors.black,
                              child: Icon(Icons.add, color: Colors.white,),
                              onPressed: (){
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            FloatingActionButton(
                              heroTag: 'Fab2',
                              backgroundColor: Colors.black,
                              child: Icon(Icons.remove , color: Colors.white,),
                              onPressed: (){
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: reusableCard(
                    clr : inactiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'AGE',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            age.toString(),
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              FloatingActionButton(
                                heroTag: 'Fab3',
                                backgroundColor: Colors.black,
                                child: Icon(Icons.add, color: Colors.white,),
                                onPressed: (){
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              FloatingActionButton(
                                heroTag : 'Fab4',
                                backgroundColor: Colors.black,
                                child: Icon(Icons.remove , color: Colors.white,),
                                onPressed: (){
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      )
                  ),
                ),
              ],
            ),
          ),
          BottomButton(buttonTitle: 'CALCULATE', onTap: (){

            CalcBrain calc = CalcBrain(height: height, weight: weight);

            Navigator.push(context, MaterialPageRoute(builder: (context) => Result(
              bmiResult: calc.CalcBMI(),
              resultText: calc.getResult(),
              interpretation: calc.getInterpretation(),
            )));
          },),
        ],
      )

    );
  }
}







