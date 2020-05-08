import 'package:bloc_repeated_states_issue/bloc/bloc.dart';
import 'package:bloc_repeated_states_issue/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:bloc_repeated_states_issue/injection_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();

  runApp(
    BlocProvider<MainBloc>(
      create: (_) => sl.get<MainBloc>(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: 'first_page',
      onGenerateRoute: RouteGenerator.generateRoute,
      onUnknownRoute: RouteGenerator.generateUnknownRoute,
    );
  }
}
