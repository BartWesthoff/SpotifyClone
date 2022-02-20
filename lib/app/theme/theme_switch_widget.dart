import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotifyclone/app/theme/theme.dart';

class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Switch(
          value: state.themeNumber == 0,
          onChanged: (newValue) {
            BlocProvider.of<ThemeBloc>(context)
                .add(ThemeChanged(themeNumber: newValue ? 1 : 0));
          },
        );
      },
    );
  }
}
