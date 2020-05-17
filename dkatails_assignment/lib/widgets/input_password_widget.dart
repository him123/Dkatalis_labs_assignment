import 'package:dkatails_assignment/widgets/input_box_wdget.dart';
import 'package:flutter/material.dart';
import 'package:dkatails_assignment/constants/constants.dart';

import 'act_button.dart';

class InputPasswordWidget extends StatefulWidget {
  const InputPasswordWidget({
    Key key,
    @required Function(int) onPressed,
  })  : _onPressed = onPressed,
        super(key: key);

  final Function(int) _onPressed;

  @override
  _InputPasswordWidgetState createState() => _InputPasswordWidgetState();
}

class _InputPasswordWidgetState extends State<InputPasswordWidget> {
  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpChar = false;
  bool hasNumbers = false;

  String getComplexity() {
    String complexity = '';

    setState(() {
      if (hasNumbers & hasSpChar & hasLowercase & hasUppercase) {
        complexity = 'Strong';
      } else if (!hasNumbers & !hasSpChar & !hasLowercase & !hasUppercase) {
        complexity = '';
      } else if (!hasNumbers) {
        if (!hasNumbers | hasSpChar & hasLowercase & hasUppercase) {
          complexity = 'medium';
        } else
          complexity = 'weak';
      } else if (!hasSpChar) {
        if (!hasSpChar & hasUppercase & hasLowercase & hasNumbers) {
          complexity = 'medium';
        } else
          complexity = 'weak';
      } else if (!hasUppercase) {
        if (!hasUppercase & hasSpChar & hasLowercase & hasNumbers) {
          complexity = 'medium';
        } else
          complexity = 'weak';
      } else if (!hasLowercase) {
        if (!hasLowercase & hasSpChar & hasUppercase & !hasNumbers) {
          complexity = 'medium';
        } else
          complexity = 'weak';
      } else {
        complexity = 'Medium';
      }
    });

    return complexity;
  }

  bool isShowPass = true;
  bool isShowError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ActButton(
          onPressed: () {
            if (hasNumbers & hasSpChar & hasLowercase & hasUppercase) {
              widget._onPressed(2);
            } else {
              setState(() {
                isShowError = true;
              });
            }
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 20.0),
              child: Text(
                'Create Password',
                textAlign: TextAlign.left,
                style: kTextTitleStyle,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, top: 10.0, right: 20.0),
              child: Text(
                'Password will be used to login to account.',
                textAlign: TextAlign.left,
                style: kTextDescStyle,
              ),
            ),

            /*Password*/ Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
              child: Column(
                children: <Widget>[
                  isShowError
                      ? Align(
                          child: Text(
                            'Please fulfill all validations',
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.red),
                          ),
                          alignment: Alignment.topLeft,
                        )
                      : SizedBox(),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    onChanged: (val) {
                      setState(() {
                        isShowError = false;
                        if (val.contains(RegExp(r'[A-Z]'))) {
                          print('Inside uppercase');
                          hasUppercase = true;
                        } else {
                          hasUppercase = false;
                        }

                        if (val.contains(RegExp(r'[a-z]'))) {
                          print('Inside lowercase');
                          hasLowercase = true;
                        } else {
                          hasLowercase = false;
                        }

                        if (val.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                          print('Inside lowercase');
                          hasSpChar = true;
                        } else {
                          hasSpChar = false;
                        }

                        if (val.contains(RegExp(r'[0-9]'))) {
                          print('Inside lowercase');
                          hasNumbers = true;
                        } else {
                          hasNumbers = false;
                        }
                      });
                    },
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: isShowPass,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 16,
                        ),
                        filled: true,
                        fillColor: kInputBG,
                        hintText: 'Password',
                        hintStyle: kHintTextForm,
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                if (isShowPass) {
                                  isShowPass = false;
                                } else {
                                  isShowPass = true;
                                }
                              });
                            },
                            child: isShowPass
                                ? Icon(Icons.remove_red_eye)
                                : Icon(Icons.visibility_off))),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 40.0, left: 20, right: 20, bottom: 20.0),
              child: Text(
                'Complexity: ${getComplexity()}',
                style: kTextDescStyle.copyWith(color: Colors.brown),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  height: 80.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      hasLowercase
                          ? Icon(
                              Icons.check_circle,
                              color: Colors.green,
                              size: 45.0,
                            )
                          : Text(
                              'a',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 45.0,
                              ),
                            ),
                      Text('Lowercase')
                    ],
                  ),
                ),
                Container(
                  height: 80.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      hasUppercase
                          ? Icon(
                              Icons.check_circle,
                              color: Colors.green,
                              size: 45.0,
                            )
                          : Text(
                              'A',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 40.0,
                              ),
                            ),
                      Text('Uppercase')
                    ],
                  ),
                ),
                Container(
                  height: 80.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      hasNumbers
                          ? Icon(
                              Icons.check_circle,
                              color: Colors.green,
                              size: 45.0,
                            )
                          : Text(
                              '123',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 40.0,
                              ),
                            ),
                      Text('Numbers')
                    ],
                  ),
                ),
                Container(
                  height: 80.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      hasSpChar
                          ? Icon(
                              Icons.check_circle,
                              color: Colors.green,
                              size: 45.0,
                            )
                          : Text(
                              '9+',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 40.0,
                              ),
                            ),
                      Text('Characters')
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
