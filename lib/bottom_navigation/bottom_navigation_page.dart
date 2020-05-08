import 'package:bloc_repeated_states_issue/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bottom_navigation.dart';

GlobalKey<BottomNavigationState> bottomNavigationPageKey;


class BottomNavigationPage extends UniqueWidget<BottomNavigationState> {
  BottomNavigationPage({GlobalKey key}) : super(key: key){
    bottomNavigationPageKey = key;
  }

  @override
  BottomNavigationState createState() => BottomNavigationState();
}

class BottomNavigationState extends State<BottomNavigationPage> {

  TabItem currentTab = TabItem.first;
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();


  void _selectTab(TabItem tabItem, {Object arguments}) {
    if (tabItem == currentTab) {
      _navigatorKey.currentState.popUntil((route) => route.isFirst);
    } else {
      setState(() => currentTab = tabItem);
      _navigatorKey.currentState.popUntil((route) => route.isFirst);
      _navigatorKey.currentState.pushReplacementNamed(tabRoute[tabItem], arguments: arguments);
    }
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Navigator(
          key: _navigatorKey,
          initialRoute: tabRoute[currentTab],
          onGenerateRoute: RouteGenerator.generateRoute,
        ),
        bottomNavigationBar: getBottomNavigationBar()
    );
  }

  BottomNavigation getBottomNavigationBar(){
    return BottomNavigation(
      currentTab: currentTab,
      onSelectTab: (tabItem) {

        _selectTab(tabItem,);
      },
    );
  }
}
