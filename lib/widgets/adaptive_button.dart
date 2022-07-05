import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveFlatButton extends StatelessWidget {
  final String text;
  final VoidCallback buttonPressed;
  const AdaptiveFlatButton(
      {Key? key, required this.text, required this.buttonPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(onPressed: buttonPressed, child: Text(text))
        : TextButton(
            onPressed: buttonPressed,
            style: TextButton.styleFrom(
                textStyle: const TextStyle(fontWeight: FontWeight.bold)),
            child: Text(text));
  }
}
