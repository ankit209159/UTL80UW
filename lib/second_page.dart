import 'package:flutter/material.dart';

import 'first_screen.dart';
import 'main.dart';

class SecondPage extends StatefulWidget {
  static const String id = 'secondPage';
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  int t = 0, i = 0, b = 0;
  Color textActivationColor = kLightGrey;
  Color imageActivationColor = kLightGrey;
  Color buttonActivationColor = kLightGrey;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kLightGreen,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(height: 1),
              AddWidgetButton(
                text: 'Text Widget',
                onTap: () {
                  setState(() {
                    if (textActivationColor == kLightGrey) {
                      textActivationColor = kDarkGreen;
                      t = 1;
                    } else {
                      textActivationColor = kLightGrey;
                      t = 0;
                    }
                  });
                },
                dotColor: textActivationColor,
              ),
              AddWidgetButton(
                text: 'Image Widget',
                onTap: () {
                  setState(() {
                    if (imageActivationColor == kLightGrey) {
                      imageActivationColor = kDarkGreen;
                      i = 1;
                    } else {
                      imageActivationColor = kLightGrey;

                      i = 0;
                    }
                  });
                },
                dotColor: imageActivationColor,
              ),
              AddWidgetButton(
                text: 'Button Widget',
                onTap: () {
                  setState(() {
                    if (buttonActivationColor == kLightGrey) {
                      buttonActivationColor = kDarkGreen;
                      b = 1;
                    } else {
                      buttonActivationColor = kLightGrey;

                      b = 0;
                    }
                  });
                },
                dotColor: buttonActivationColor,
              ),
              const SizedBox(height: 30),
              AppBottomButton(
                text: 'Import Widget',
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return FirstPage(
                      t: t,
                      i: i,
                      b: b,
                    );
                  }));
                },
              ),
              const SizedBox(height: 1),
            ],
          ),
        ),
      ),
    );
  }
}

//Common button class to add widget
class AddWidgetButton extends StatelessWidget {
  final String? text;
  final Function()? onTap;
  final Color? dotColor;
  const AddWidgetButton({super.key, this.text, this.onTap, this.dotColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(12),
            height: 50,
            width: 50,
            color: kAppWhite,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: dotColor,
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 20),
          alignment: Alignment.centerLeft,
          color: kLightGrey,
          height: 50,
          width: 270,
          child: Text(
            '$text',
            style: kNormalTextStyle,
          ),
        ),
      ],
    );
  }
}
