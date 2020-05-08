import 'package:flutter/material.dart';

enum TabItem { first, second, }

Map<TabItem, String> tabName = {
  TabItem.first: 'first',
  TabItem.second: 'second',
};

Map<TabItem, String> tabRoute = {
  TabItem.first: 'first_page',
  TabItem.second: 'second_page',
};

class BottomNavigation extends StatelessWidget {
  BottomNavigation({this.currentTab, this.onSelectTab, this.tabNotification});
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;
  final Map<TabItem, bool> tabNotification;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,

      items: [
        _buildItem(tabItem: TabItem.first),
        _buildItem(tabItem: TabItem.second),
      ],
      onTap: (index) => onSelectTab(
        TabItem.values[index],
      ),
    );
  }

  BottomNavigationBarItem _buildItem({TabItem tabItem}) {
    String text = tabName[tabItem];
    return BottomNavigationBarItem(
      icon: Icon(Icons.add),
      title: Text(
        text
      ),
    );
  }
}
