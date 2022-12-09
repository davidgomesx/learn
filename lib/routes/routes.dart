import 'package:flutter/material.dart';
import 'package:learn/authentication/authentication.dart';
import 'package:learn/home/home.dart';

List<Page<dynamic>> onGenerateAppViewPages(
  AuthStatus state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case AuthStatus.authenticated:
      return [
        const MaterialPage<void>(
          child: HomePage(),
        ),
      ];
    case AuthStatus.unauthenticated:
      return [
        const MaterialPage<void>(
          child: LoginPage(),
        )
      ];
    case AuthStatus.inProgress:
      return [
        const MaterialPage<void>(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Center(child: CircularProgressIndicator()),
          ),
        )
      ];
  }
}
