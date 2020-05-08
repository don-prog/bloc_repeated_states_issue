import 'package:bloc_repeated_states_issue/bloc/bloc.dart';
import 'package:bloc_repeated_states_issue/bottom_navigation/bottom_navigation_page.dart';
import 'package:bloc_repeated_states_issue/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:bloc_repeated_states_issue/injection_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();

  runApp(BlocProvider<MainBloc>(
      create: (_) => sl(),
      child: MyApp()));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  MainBloc _mainBloc;

  @override
  void initState() {
    super.initState();

    _mainBloc = BlocProvider.of<MainBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BottomNavigationPage(key: GlobalKey<BottomNavigationState>(),)


    );
  }
}