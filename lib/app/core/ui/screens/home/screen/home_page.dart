import 'package:spotifyclone/app/core/authentication/bloc/auth_bloc.dart';
import 'package:spotifyclone/app/core/authentication/bloc/auth_event.dart';
import 'package:spotifyclone/app/core/ui/screens/home/widgets/avatar.dart';
import 'package:spotifyclone/app/core/ui/theme/bloc/theme_bloc.dart';
import 'package:spotifyclone/app/core/ui/theme/bloc/theme_event.dart';
import 'package:spotifyclone/app/core/ui/theme/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: HomePage());

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final user = context.select((AuthBloc bloc) => bloc.state.user);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Home'),
        actions: <Widget>[
          IconButton(
            key: const Key('homePage_logout_iconButton'),
            icon: const Icon(Icons.exit_to_app),
            onPressed: () => context.read<AuthBloc>().add(AppLogoutRequested()),
          )
        ],
      ),
      body: Align(
        alignment: const Alignment(0, -1 / 3),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Avatar(photo: user.photo),
            const SizedBox(height: 4),
            Text(user.email ?? '', style: textTheme.headline6),
            const SizedBox(height: 4),
            Text(user.name ?? '', style: textTheme.headline5),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(8),
                itemCount: AppTheme.values.length,
                itemBuilder: (context, index) {
                  // Enums expose their values as a list - perfect for ListView
                  // Store the theme for the current ListView item
                  final itemAppTheme = AppTheme.values[index];
                  return Card(
                    // Style the cards with the to-be-selected theme colors
                    color: appThemeData[itemAppTheme]?.primaryColor,
                    child: ListTile(
                      title: Text(
                        itemAppTheme.toString(),
                        // To show light text with the dark variants...
                        style: appThemeData[itemAppTheme]?.textTheme.bodyText1,
                      ),
                      onTap: () {
                        // This will make the Bloc output a new ThemeState,
                        // which will rebuild the UI because of the BlocBuilder in main.dart
                        BlocProvider.of<ThemeBloc>(context)
                            .add(ThemeChanged(theme: itemAppTheme));
                      },
                    ),
                  );
                },
              ),
            ),

            // BlocBuilder<ThemeBloc, ThemeState>(
            //   builder: (BuildContext context, state) {
            //     return SwitchListTile(
            //         value: false,
            //         onChanged: (value) {
            //
            //         });
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}