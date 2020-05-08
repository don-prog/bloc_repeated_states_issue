import 'package:bloc_repeated_states_issue/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_repeated_states_issue/pages/first_page.dart';
import 'package:bloc_repeated_states_issue/pages/second_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'first_page':
        return PageRouteBuilder(
          pageBuilder: (_c, _a1, _a2) => BlocProvider<FirstPageBloc>(
            create: (_) => FirstPageBloc(),
            child: FirstPage(),
          ),
        );

      case 'second_page':
        return PageRouteBuilder(pageBuilder: (_c, _a1, _a2) => SecondPage());
      default:
        return null;
    }
  }

  static Route<dynamic> generateUnknownRoute(RouteSettings settings) {
    return PageRouteBuilder(
      pageBuilder: (_c, _a1, _a2) => const Scaffold(
        body: Center(
          child: Text('Unknown route'),
        ),
      ),
    );
  }
}
