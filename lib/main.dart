import 'package:flutter/material.dart';

import 'first_screen.dart';
import 'second_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: FirstPage.id,
      routes: {
        FirstPage.id: (context) => const FirstPage(),
        SecondPage.id: (context) => const SecondPage(),
      },
    );
  }
}

//all const values
const kAppWhite = Color(0xffffffff);
const kLightGreen = Color(0xffEBFFE8);
const kMedGreen = Color(0xffACFEA7);
const kDarkGreen = Color(0xff52E552);
const kAppBlack = Color(0xff000000);
const kLightGrey = Color(0xffE6E6E6);

const kHeadingTextStyle = TextStyle(
  fontWeight: FontWeight.w600,
  fontSize: 30,
);

const kNormalTextStyle = TextStyle(
  color: kAppBlack,
  fontWeight: FontWeight.w500,
  fontSize: 20,
);

class AppBottomButton extends StatelessWidget {
  final String? text;
  final Function()? onPressed;
  const AppBottomButton({super.key, this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: kMedGreen,
        padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 10),
        side: const BorderSide(width: 1.5, color: kAppBlack),
      ),
      onPressed: onPressed,
      child: Text('$text', style: kNormalTextStyle),
    );
  }
}
