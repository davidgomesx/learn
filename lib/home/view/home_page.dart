import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:learn/authentication/authentication.dart';
import 'package:learn/ui/ui.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: HomePage());

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final user = context.select((AuthenticationBloc bloc) => bloc.state.user);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: <Widget>[
          IconButton(
            key: const Key('homePage_logout_iconButton'),
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              context
                  .read<AuthenticationBloc>()
                  .add(const AppLogoutRequested());
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UiButton.compact(
              color: Colors.blue.shade500,
              text: 'Earthquake',
              onPressed: () {},
            ),
            UiButton.compact(
              color: Colors.amber,
              text: 'text',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
