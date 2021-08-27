import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'constants.dart';
import 'results_page.dart';
enum Gender {
  male,
  female,
}
Gender selectedGender ;
int height = 180;
int weight = 80;
int age = 35;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  // Color maleCardColour = inactiveCardColour;
  // Color femaleCardColour = inactiveCardColour;
  //1=male 2=female
  // void updateColour(Gender gender) {
  //   // male card pressed
  //   if (gender == Gender.male) {
  //     if (maleCardColour == inactiveCardColour) {
  //       maleCardColour = activeCardColour;
  //       femaleCardColour = inactiveCardColour;
  //     }
  //     else {
  //       maleCardColour = inactiveCardColour;
  //     }
  //
  //   }
  //   if (gender == Gender.female) {
  //     if (femaleCardColour == inactiveCardColour) {
  //       femaleCardColour = activeCardColour;
  //       maleCardColour = inactiveCardColour;
  //     }
  //     else {
  //       femaleCardColour = inactiveCardColour;
  //     }
  //   }
  //
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
          titleSpacing: 84,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Row(
            children: [
              Expanded(
                child:ReusableCard(
                  colour:selectedGender == Gender.male ? kActiveCardColour:kInactiveCardColour,
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    },);
                  },
                  cardChild: ReusableIcon(
                    label:"MALE",
                    icon:FontAwesomeIcons.mars,
                  ),),),

          Expanded(
              child: ReusableCard(
              colour:selectedGender == Gender.female ? kActiveCardColour : kInactiveCardColour,
                onPress: () {
                setState(() {
                  selectedGender = Gender.female;
                });
                },
                cardChild: ReusableIcon(
                  label:"FEMALE",
                  icon:FontAwesomeIcons.venus,
                ),
          ),),],),),
          Expanded(
            child:ReusableCard(
              colour:kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "HEIGHT",
                    style: kLabelTextStyle,
                  ),
                  SizedBox(height:1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(),
                      style: kNumberTextStyle,),
                      Text(
                        "cm",
                        style:kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data:SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                      thumbColor: Color(0xFFEB1555),
                      activeTrackColor: Colors.white,
                      overlayColor: Color(0x29EB1555),
                    ),
                    child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        }
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(child: Row(
            children: [
              Expanded(child: ReusableCard(
                  colour:kActiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("WEIGHT",
                    style: kLabelTextStyle,),
                    Text(weight.toString(),
                    style: kNumberTextStyle,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:[ RoundIconButton(
                        icon: FontAwesomeIcons.minus,
                        onPressed: () {
                          setState(() {
                            if (weight>1) {
                              weight = weight - 1;
                            }
                          });
                        },
                      ),
                        SizedBox(width: 10,),
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          onPressed: () {
                            setState(() {
                              weight = weight +1;
                            });
                          },
                        ),

                          ],
                    )
                  ],
                ),
              ),),
              Expanded(child: ReusableCard(
                  colour:kActiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'AGE',
                      style: kLabelTextStyle,
                    ),
                    Text(
                      age.toString(),
                      style:kNumberTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(icon: FontAwesomeIcons.minus,
                            onPressed: () {
                          setState(() {
                            if (age>1) {
                              age = age-1;
                            }
                          });
                            }),
                        SizedBox(width: 10),
                        RoundIconButton(icon: FontAwesomeIcons.plus,
                            onPressed: (){
                          setState(() {
                            if (age<129) {
                              age = age + 1;
                            }
                          });
                            }),
                      ],
                    )


                  ],
                ),
              ),),
            ],
          ),),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ResultsPage()));
            },
            child: Container(
              child:Center(child: Text('CALCULATE',style: TextStyle(
                fontSize: 26,
                color: Colors.white,
              ),),),
              color:kBottomContainerColour,
              margin:EdgeInsets.only(top:10.0),
              width:double.infinity,
              height:kBottomContainerHeight,

            ),
          ),],
    ),);
  }
}
class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon,@required this.onPressed});
  final IconData icon;
  final Function onPressed;


  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        icon,
      ),
      shape: CircleBorder(),
        fillColor: Color(0xFF4C4F5E),
        onPressed: onPressed,
        elevation: 6,
        constraints: BoxConstraints.tightFor(
          width: 56.0,
          height: 56.0,
        ),
        );
  }

}


// class ReusableIcon extends StatelessWidget {
//   ReusableIcon({@required this.icon,@required this.label});
//   final IconData icon;
//   final String label;
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//     mainAxisAlignment: MainAxisAlignment.center,
//               children:[
//               Icon(
//               icon,
//               size:80.0,
//
//               ),
//               SizedBox(height:15.0),
//               Text(
//               label,
//               style:TextStyle(
//               fontSize: 18,
//               color: Color(0xFF8D8E98),
//               ),
//               ),],);
//   }
// }



// class ReusableCard extends StatelessWidget {
//   ReusableCard({@required this.colour,this.cardChild});
//   final Color colour;
//   final Widget cardChild;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child:cardChild,
//       margin:EdgeInsets.all(15),
//       decoration:BoxDecoration(
//         color:colour,
//         borderRadius:BorderRadius.circular(10.0),
//       ),
//     );
//   }
// }
