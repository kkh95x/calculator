

import 'package:flutter/material.dart';

class CalculatorHomeScreen extends StatefulWidget {
  const CalculatorHomeScreen({super.key});

  @override
  State<CalculatorHomeScreen> createState() => _CalculatorHomeScreenState();
}

class _CalculatorHomeScreenState extends State<CalculatorHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [Colors.lightBlue.shade900, Colors.black],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          )),
          child: Column(
            children: [
              getInputFildes(),
              getResultFildes(),
              getGridButton(),
            ],
          )),
    );
  }

  Size getSize() {
    return MediaQuery.of(context).size;
  }

  Widget getInputFildes() {
    Size size = getSize();
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.15),
      child: Container(
        alignment: Alignment.center,
        width: size.width * 0.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          resultWord,
          style: TextStyle(fontSize: size.width * 0.06),
        ),
      ),
    );
  }

  Widget getResultFildes() {
    Size size = getSize();
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.05),
      child: Container(
        alignment: Alignment.center,
        width: size.width * 0.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          temp.toString(),
          style: TextStyle(fontSize: size.width * 0.09),
        ),
      ),
    );
  }

  Widget getGridButton() {
    Size size = getSize();
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.05),
      child: Container(
        width: size.width * 0.9,
        height: size.height * 0.65,
        child: Row(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    coustomButton(
                        text: "AC",
                        onPress: () {
                          buttonOnPress("AC");
                        },
                        buttonColor: const Color(0xff616161),
                        textColor: const Color(0xffA5A5A5)),
                    coustomButton(
                        text: "C",
                        onPress: () {
                          buttonOnPress("C");
                        },
                        buttonColor: const Color(0xff616161),
                        textColor: const Color(0xffA5A5A5)),
                    coustomButton(
                        text: "/",
                        onPress: () {
                          buttonOnPress("/");
                        },
                        buttonColor: const Color(0xff616161),
                        textColor: const Color(0xffA5A5A5)),
                  ],
                ),
                Row(
                  children: [
                    coustomButton(
                        text: "7",
                        onPress: () {
                          buttonOnPress("7");
                        }),
                    coustomButton(
                        text: "8",
                        onPress: () {
                          buttonOnPress("8");
                        }),
                    coustomButton(
                        text: "9",
                        onPress: () {
                          buttonOnPress("9");
                        })
                  ],
                ),
                Row(
                  children: [
                    coustomButton(
                        text: "4",
                        onPress: () {
                          buttonOnPress("4");
                        }),
                    coustomButton(
                        text: "5",
                        onPress: () {
                          buttonOnPress("5");
                        }),
                    coustomButton(
                        text: "6",
                        onPress: () {
                          buttonOnPress("6");
                        })
                  ],
                ),
                Row(
                  children: [
                    coustomButton(
                        text: "1",
                        onPress: () {
                          buttonOnPress("1");
                        }),
                    coustomButton(
                        text: "2",
                        onPress: () {
                          buttonOnPress("2");
                        }),
                    coustomButton(
                        text: "3",
                        onPress: () {
                          buttonOnPress("3");
                        })
                  ],
                ),
                Row(
                  children: [
                    coustomButton(
                        text: "0",
                        onPress: () {
                          buttonOnPress("0");
                        },
                        buttonSize: 0.40),
                    coustomButton(
                        text: ".",
                        onPress: () {
                          buttonOnPress(".");
                        }),
                  ],
                ),
              ],
            ),
            pluseEquleButton(),
          ],
        ),
      ),
    );
  }

  Widget coustomButton(
      {required String text,
      Color buttonColor = const Color(0xff303136),
      double textSize = 0.05,
      double raduis = 15,
      double buttonSize = 0.18,
      Color textColor = const Color(0xff339Dff),
      double buttonHight = 80,
      required Function onPress}) {
    Size size = getSize();
    return TextButton(
        onPressed: () {
          setState(() {
            onPress();
          });
        },
        child: Container(
          alignment: Alignment.center,
          height: buttonHight,
          width: size.width * buttonSize,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(raduis), color: buttonColor),
          child: Text(
            text,
            style: TextStyle(
              fontSize: size.width * textSize,
            ),
          ),
        ));
  }

  Widget pluseEquleButton() {
    return Column(
      children: [
        coustomButton(
            text: "*",
            onPress: () {
              buttonOnPress("*");
            },
            buttonColor: const Color(0xff005DB2)),
        coustomButton(
            text: "-",
            onPress: () {
              buttonOnPress("-");
            },
            buttonColor: const Color(0xff005DB2)),
        coustomButton(
            text: "+",
            onPress: () {
              buttonOnPress("+");
            },
            buttonColor: const Color(0xff005DB2),
            buttonHight: 174),
        coustomButton(
            text: "=",
            onPress: () {
              buttonOnPress("=");
            },
            buttonColor: const Color(0xff005DB2)),
      ],
    );
  }

  int firstNumber = 0, secondNumber = 0;
  int i = 0;
  String op = "";
  dynamic result = 0;
  int temp = 0;
  String resultWord = "";

  void buttonOnPress(String inputValue) {
    if (inputValue.toString() == "AC" || inputValue.toString() == "C") {
      switch (inputValue) {
        case "AC":
          firstNumber = secondNumber = 0;
          resultWord = "";
          result = 0;
          op = "";
          i = 0;
          break;
        case "C":
          temp = temp ~/ 10;

          break;
      }
    } else if (inputValue.toString() == "+" ||
        inputValue.toString() == "-" ||
        inputValue.toString() == "/" ||
        inputValue.toString() == "*") {
      //we can pass value without switch
      resultWord += "$temp $inputValue ";
      firstNumber = temp;

      temp = 0;
      i = 0;
      op = inputValue.toString();
    } else if (inputValue.toString() == "=") {
      resultWord += "$temp = ";
      secondNumber = temp;
      i = 0;
      temp = 0;

      getResult();
      resultWord += "$result";
    } else {
      if (result != 0) {
        result = 0;
        resultWord = "";
      }
      temp = (10 * i * temp).toInt() + int.parse(inputValue);
      i = 1;
    }
  }

  void getResult() {
    switch (op) {
      case "+":
        result = (firstNumber + secondNumber);
        break;
      case "-":
        result = (firstNumber - secondNumber);
        break;
      case "*":
        result = (firstNumber * secondNumber);
        break;
      case "/":
        result = (firstNumber / secondNumber);
        break;
    }
    firstNumber = secondNumber = 0;
  }
}
