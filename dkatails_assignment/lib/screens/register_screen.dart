import 'package:dkatails_assignment/constants/constants.dart';
import 'package:dkatails_assignment/screens/welcome_screen.dart';
import 'package:dkatails_assignment/widgets/email_input_widget.dart';
import 'package:dkatails_assignment/widgets/input_box_wdget.dart';
import 'package:dkatails_assignment/widgets/input_password_widget.dart';
import 'package:dkatails_assignment/widgets/personal_info_input_widget.dart';
import 'package:dkatails_assignment/widgets/schedule_vidocall_widget.dart';
import 'package:dkatails_assignment/widgets/top_circle_widget.dart';
import 'package:flutter/material.dart';

class UserRegisterScree extends StatefulWidget {
  @override
  _UserRegisterScreeState createState() => _UserRegisterScreeState();
}

class _UserRegisterScreeState extends State<UserRegisterScree> {
  int currentPage = 0;
  var _viewPageController = PageController();

  void onNextPressed(int val) {
    if (val == 4) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (BuildContext context) => WelcomeScreen()),
        ModalRoute.withName('/'),
      );
    } else {
      _viewPageController.animateToPage(val,
          duration: Duration(milliseconds: 100), curve: Curves.linear);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            /*TOP CIRCLES*/ Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  TopCircle(
                    level: '1',
                    colorBb: currentPage >= 0 ? Colors.green : Colors.white,
                  ),
                  SizedBox(
                      width: 30.0,
                      child: Divider(
                        color: Colors.black,
                        thickness: 4.0,
                      )),
                  TopCircle(
                    level: '2',
                    colorBb: currentPage >= 1 ? Colors.green : Colors.white,
                  ),
                  SizedBox(
                      width: 30.0,
                      child: Divider(
                        color: Colors.black,
                        thickness: 4.0,
                      )),
                  TopCircle(
                    level: '3',
                    colorBb: currentPage >= 2 ? Colors.green : Colors.white,
                  ),
                  SizedBox(
                      width: 30.0,
                      child: Divider(
                        color: Colors.black,
                        thickness: 4.0,
                      )),
                  TopCircle(
                    level: '4',
                    colorBb: currentPage >= 3 ? Colors.green : Colors.white,
                  )
                ],
              ),
            ),
            Expanded(
              child: PageView(
                controller: _viewPageController,
                physics: NeverScrollableScrollPhysics(),
                onPageChanged: (pageNo) {
                  print('page no: $pageNo');
                  setState(() {
                    currentPage = pageNo;
                  });
                },
                children: <Widget>[
                  EmailInputWidget(
                    onPressed: onNextPressed,
                  ),
                  InputPasswordWidget(
                    onPressed: onNextPressed,
                  ),
                  PersonalInformationWidget(
                    onPressed: onNextPressed,
                  ),
                  ScheduleVideoCallWidget(
                    onPressed: onNextPressed,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
