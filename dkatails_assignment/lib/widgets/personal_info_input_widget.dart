import 'package:dkatails_assignment/constants/constants.dart';
import 'package:flutter/material.dart';

import 'act_button.dart';
import 'input_box_wdget.dart';

class PersonalInformationWidget extends StatefulWidget {
  final Function(int) _onPressed;

  const PersonalInformationWidget({
    Key key,
    @required Function(int) onPressed,
  })  : _onPressed = onPressed,
        super(key: key);

  @override
  _PersonalInformationWidgetState createState() =>
      _PersonalInformationWidgetState();
}

class _PersonalInformationWidgetState extends State<PersonalInformationWidget> {
  List<String> goals = ['Goal1', 'Goal2', 'Goal3'];
  List<String> income = ['12 LPA', '24 LPA', '48 LPA'];
  List<String> expense = ['6 LPA', '8 LPA', '10 LPA'];

  String _selectedTypeGoal;
  String _selectedTypeIncome;
  String _selectedTypeExp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ActButton(
          onPressed: () {
            widget._onPressed(3);
          },
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 20.0),
            child: Text(
              'Personal Information',
              textAlign: TextAlign.left,
              style: kTextTitleStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 10.0, right: 20.0),
            child: Text(
              'Please fill in the information below and your goal for digital savings.',
              textAlign: TextAlign.left,
              style: kTextDescStyle,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Please set your Goal',
                  style: TextStyle(color: Colors.black),
                )),
          ),
          /*GOALS*/ Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 60.0,
            decoration: BoxDecoration(
                color: kInputBG,
                borderRadius: BorderRadius.all(Radius.circular(9.0))),
            padding: EdgeInsets.all(10.0),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                  items: goals.map((String val) {
                    return DropdownMenuItem<String>(
                      value: val,
                      child: Text(val),
                    );
                  }).toList(),
                  hint: Text(_selectedTypeGoal ?? goals.toList()[0]),
                  onChanged: (String val) {
                    setState(() {
                      _selectedTypeGoal = val;
//                    _selectedIcon = _data[val];
                    });
                  }),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Please select your Income',
                  style: TextStyle(color: Colors.black),
                )),
          ),
          /*INCOME*/ Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 60.0,
            decoration: BoxDecoration(
                color: kInputBG,
                borderRadius: BorderRadius.all(Radius.circular(9.0))),
            padding: EdgeInsets.all(10.0),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                  items: income.map((String val) {
                    return DropdownMenuItem<String>(
                      value: val,
                      child: Text(val),
                    );
                  }).toList(),
                  hint: Text(_selectedTypeIncome ?? income.toList()[0]),
                  onChanged: (String val) {
                    setState(() {
                      _selectedTypeIncome = val;
//                    _selectedIcon = _data[val];
                    });
                  }),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Please select your Expense',
                  style: TextStyle(color: Colors.black),
                )),
          ),
          /*EXPENSE*/ Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 60.0,
            decoration: BoxDecoration(
                color: kInputBG,
                borderRadius: BorderRadius.all(Radius.circular(9.0))),
            padding: EdgeInsets.all(10.0),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                  items: expense.map((String val) {
                    return DropdownMenuItem<String>(
                      value: val,
                      child: Text(val),
                    );
                  }).toList(),
                  hint: Text(_selectedTypeExp ?? expense.toList()[0]),
                  onChanged: (String val) {
                    setState(() {
                      _selectedTypeExp = val;
//                    _selectedIcon = _data[val];
                    });
                  }),
            ),
          )
        ],
      ),
    );
  }
}
