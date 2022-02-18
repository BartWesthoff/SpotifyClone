import 'package:flutter/material.dart';

class PrimaryActionButton extends StatelessWidget {
  final String text;
  const PrimaryActionButton({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => {},
        child: Text(text,
            style: TextStyle(
                color: Theme.of(context).scaffoldBackgroundColor,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        style: ButtonStyle(
            overlayColor:
                MaterialStateProperty.all(Colors.white.withOpacity(0.1)),
            padding: MaterialStateProperty.all(EdgeInsets.all(12.0)),
            splashFactory: InkRipple.splashFactory,
            backgroundColor:
                MaterialStateProperty.all(Theme.of(context).primaryColor),
            minimumSize: MaterialStateProperty.all(Size(double.infinity, 0)),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            maximumSize: MaterialStateProperty.all(Size.infinite)));
  }
}
