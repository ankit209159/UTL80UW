import 'package:flutter/material.dart';

import 'main.dart';
import 'second_page.dart';

class FirstPage extends StatefulWidget {
  final int? t, i, b;
  static const String id = 'firstPage';
  const FirstPage({super.key, this.t, this.i, this.b});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  bool s = false, z = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Assignment App',
                style: kHeadingTextStyle,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                  decoration: BoxDecoration(
                      color: kLightGreen,
                      borderRadius: BorderRadius.circular(30)),
                  alignment: Alignment.center,
                  child: (widget.t ?? 0) == 0 &&
                          (widget.i ?? 0) == 0 &&
                          (widget.b ?? 0) == 0
                      ? const Text('No widget is added',
                          style: kHeadingTextStyle)
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Visibility(
                              visible: widget.t == 1 ? true : false,
                              child: Container(
                                padding: const EdgeInsets.only(left: 20),
                                alignment: Alignment.centerLeft,
                                color: kLightGrey,
                                height: 50,
                                width: 270,
                                child: const Text(
                                  'Enter Text',
                                  style: kNormalTextStyle,
                                ),
                              ),
                            ),
                            Visibility(
                              visible: widget.i == 1 ? true : false,
                              child: Container(
                                alignment: Alignment.center,
                                color: kLightGrey,
                                height: 220,
                                width: 270,
                                child: const Text(
                                  'Upload Image',
                                  style: kNormalTextStyle,
                                ),
                              ),
                            ),
                            Visibility(
                              visible: z,
                              child: const Text(
                                'Add at-least a\nwidget to save',
                                style: kHeadingTextStyle,
                              ),
                            ),
                            Visibility(
                              visible: widget.b == 1 ? true : false,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (widget.i == 0 && widget.t == 0) {
                                      z = true;
                                    } else {
                                      s = true;
                                    }
                                  });
                                },
                                child: Container(
                                  // height: 50,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 7, horizontal: 10),
                                  decoration: BoxDecoration(
                                    color: kMedGreen,
                                    border: Border.all(width: 1.5),
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                  child: const Text(
                                    'Save',
                                    style: kNormalTextStyle,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: AppBottomButton(
                text: 'Add Widgets',
                onPressed: () {
                  Navigator.popAndPushNamed(context, SecondPage.id);
                },
              ),
            ),
            Visibility(
              visible: s,
              child: Container(
                alignment: Alignment.center,
                height: 30,
                width: double.infinity,
                color: kMedGreen,
                child: const Text('Successfully Saved'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
