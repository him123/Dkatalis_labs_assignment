import 'package:dkatails_assignment/constants/constants.dart';
import 'package:flutter/material.dart';

import 'act_button.dart';
import 'input_box_wdget.dart';

class ScheduleVideoCallWidget extends StatefulWidget {
  final Function(int) _onPressed;

  const ScheduleVideoCallWidget({
    Key key,
    @required Function(int) onPressed,
  })  : _onPressed = onPressed,
        super(key: key);

  @override
  _ScheduleVideoCallWidgetState createState() =>
      _ScheduleVideoCallWidgetState();
}

class _ScheduleVideoCallWidgetState extends State<ScheduleVideoCallWidget>
    with SingleTickerProviderStateMixin {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime)
      setState(() {
        selectedTime = picked;
      });
  }

  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    _animationController =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    _animationController.repeat(reverse: true);
    _animation = Tween(begin: 2.0, end: 15.0).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ActButton(
          onPressed: () {
            widget._onPressed(4);
          },
        ),
      ),
      body: Column(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Container(
                  width: 60,
                  height: 60,
                  child: Icon(
                    Icons.calendar_today,
                    color: Colors.white,
                  ),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF42a5f5),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.blue,
                            blurRadius: _animation.value,
                            spreadRadius: _animation.value)
                      ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                child: Text(
                  'Schedule Video Call',
                  textAlign: TextAlign.left,
                  style: kTextTitleStyle,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, top: 10.0, right: 20.0),
                child: Text(
                  'Choose the date and time that you prefered, we will send a link via email to make a video call on the schedule date and time.',
                  textAlign: TextAlign.left,
                  style: kTextDescStyle,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          /*SELECT DATE*/ InkWell(
            onTap: () {
              _selectDate(context);
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 60.0,
              decoration: BoxDecoration(
                  color: kInputBG,
                  borderRadius: BorderRadius.all(Radius.circular(9.0))),
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                      "${selectedDate.toLocal().day} - ${selectedDate.toLocal().month} - ${selectedDate.toLocal().year}"),
                  Icon(Icons.keyboard_arrow_down)
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          /*SELECT TIME*/ InkWell(
            onTap: () {
              _selectTime(context);
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 60.0,
              decoration: BoxDecoration(
                  color: kInputBG,
                  borderRadius: BorderRadius.all(Radius.circular(9.0))),
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(selectedTime.hour.toString() +
                      ' : ' +
                      selectedTime.minute.toString()),
                  Icon(Icons.keyboard_arrow_down)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
