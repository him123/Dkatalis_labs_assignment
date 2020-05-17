import 'package:dkatails_assignment/constants/constants.dart';
import 'package:flutter/material.dart';

class InputBoxWidget extends StatelessWidget {
  const InputBoxWidget({
    Key key,
    @required TextEditingController emailController,
    @required Icon icon,
    @required String hint,
    @required Function(String) onChanged,
    @required TextInputType textInputType,
    @required Function(String) validator,
    @required bool obscureText,
  })  : _emailController = emailController,
        _icon = icon,
        _hint = hint,
        _onChanged = onChanged,
        _textInputType = textInputType,
        _validator = validator,
        _obscureText=obscureText,
        super(key: key);

  final TextEditingController _emailController;
  final Icon _icon;
  final String _hint;
  final Function(String) _onChanged;
  final TextInputType _textInputType;
  final Function(String) _validator;
  final bool _obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (val) {
        _onChanged(val);
      },

      validator: _validator,
      controller: _emailController,
      keyboardType: _textInputType,
      obscureText: _obscureText,
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
          hintText: _hint,
          hintStyle: kHintTextForm,
          prefixIcon: _icon,),
    );
  }
}
