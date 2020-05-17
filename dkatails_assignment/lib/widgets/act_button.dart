import 'package:flutter/material.dart';

class ActButton extends StatelessWidget {
  const ActButton({
    Function onPressed,
    Key key,
  }) : _onPressed = onPressed, super( key: key);

  final Function _onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _onPressed,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 60.0,
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(9.0))),
        child: Center(
            child: Text(
              'Next',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 18.0),
            )),
      ),
    );
  }
}