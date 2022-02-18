import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotifyclone/app/core/ui/theme/bloc/theme_bloc.dart';
import 'package:spotifyclone/app/core/ui/theme/bloc/theme_state.dart';

import 'bloc/theme_event.dart';

class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Switch(
          value: state.themeNumber == 0 ? false : true,
          onChanged: (newValue) {
            BlocProvider.of<ThemeBloc>(context)
                .add(ThemeChanged(themeNumber: newValue ? 1 : 0));
          },
        );
      },
    );
  }
}
