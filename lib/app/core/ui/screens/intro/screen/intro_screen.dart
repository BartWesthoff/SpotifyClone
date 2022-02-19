import 'package:flutter/material.dart';
import 'package:spotifyclone/app/routes/routes.dart';
import 'package:spotifyclone/app/widgets/primary_action_button_widget.dart';
import 'package:spotifyclone/app/widgets/secondary_action_button_widget.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);
  static Page page() => const MaterialPage<void>(child: IntroScreen());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 100),
            Center(
                child: Image.asset('assets/images/spotify_logo_black.png',
                    width: 200)),
            SizedBox(height: 88),
            Text(
              "We play the music. You enjoy it. Deal?",
              style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'GothamMedium'),
            ),
            SizedBox(height: 88),
            PrimaryActionButton(
                text: "SIGN UP",
                onTap: () =>
                    Navigation.instance.pushNamed(route: Routes.signUp)),
            SizedBox(height: 16),
            SecondaryActionButton(
                text: "LOG IN",
                onTap: () =>
                    Navigation.instance.pushNamed(route: Routes.login)),
            SizedBox(height: 120),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48.0),
              child: Text(
                "By clicking on Sign up, you agree to Spotify's Terms and Conditions of Use.",
                style: Theme.of(context).textTheme.subtitle2,
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
