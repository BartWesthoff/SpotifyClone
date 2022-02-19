import 'package:flutter/material.dart';

class PrimaryActionButton extends StatelessWidget {
  final void Function() onTap;
  final String text;
  const PrimaryActionButton({Key? key, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: Text(text,
          style: TextStyle(
              fontFamily: 'GothamMedium',
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: 18,
              fontWeight: FontWeight.bold)),
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(Theme.of(context).colorScheme.primary),
        // backgroundColor:
        //     MaterialStateProperty.all(Theme.of(context).primaryColor),
        // overlayColor:
        //     MaterialStateProperty.all(Colors.white.withOpacity(0.1)),
        padding:
            MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 20.0)),
        splashFactory: InkRipple.splashFactory,
        minimumSize: MaterialStateProperty.all(Size(double.infinity, 0)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        maximumSize: MaterialStateProperty.all(Size.infinite),
      ),
    );
  }
}
