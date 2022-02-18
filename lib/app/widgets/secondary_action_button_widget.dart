import 'package:flutter/material.dart';
import 'package:spotifyclone/app/core/ui/theme/themes/owntheme.dart';

class SecondaryActionButton extends StatelessWidget {
  final String text;
  const SecondaryActionButton({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => {},
        child: Text(
          text,
          style: TextStyle(
              color: Theme.of(context).invertedTextColor,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        style: ButtonStyle(
            overlayColor:
                MaterialStateProperty.all(Colors.white.withOpacity(0.1)),
            padding: MaterialStateProperty.all(EdgeInsets.all(12.0)),
            minimumSize: MaterialStateProperty.all(Size(double.infinity, 0)),
            foregroundColor: MaterialStateProperty.all(
                Theme.of(context).scaffoldBackgroundColor),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                side: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            maximumSize: MaterialStateProperty.all(Size.infinite)));
  }
}
