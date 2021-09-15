import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nested_nav/bloc/nav/simple_detail.dart';
import 'package:nested_nav/bloc/tab_navigator.dart';
import 'package:nested_nav/camera_page.dart';

import 'bloc/nav/nav_bloc.dart';
import 'bloc/nav/nav_event.dart';
import 'bloc/nav/nav_state.dart';
import 'bloc/simple_page.dart';

class BasicBottomNavBar extends StatefulWidget {
  const BasicBottomNavBar({Key? key}) : super(key: key);

  @override
  _BasicBottomNavBarState createState() => _BasicBottomNavBarState();
}

class _BasicBottomNavBarState extends State<BasicBottomNavBar> {
  static Map<NavItem, Widget> _pages = {
    NavItem.calls: Scaffold(
        appBar: AppBar(
          title: Text('BLETTER'),
        ),
        body: Center(
          child: Icon(
            Icons.call,
            size: 150,
          ),
        )),
    NavItem.camera: CameraPage(),
    NavItem.chats: Icon(
      Icons.chat,
      size: 150,
    )
  };
  int _selectedIndex = 0;

  var _currentTab = NavItem.calls;
  final _navigatorKeys = {
    NavItem.calls: GlobalKey<NavigatorState>(),
    NavItem.camera: GlobalKey<NavigatorState>(),
    NavItem.chats: GlobalKey<NavigatorState>(),
  };

  Widget _buildOffstageNavigator(
      NavItem navItem, Icon icon, String pageText, String titleText) {
    return Offstage(
      offstage: _currentTab != navItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[navItem]!,
        icon: icon,
        pageText: pageText,
        titleText: titleText,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NavBloc>(
      create: (context) => NavBloc(),
      child: BlocBuilder<NavBloc, NavState>(
        builder: (context, state) {
          return Scaffold(
            body: Stack(children: <Widget>[
              _pages[NavItem.calls]!,
              _buildOffstageNavigator(NavItem.camera,
                  Icon(Icons.camera, size: 150), 'Camera Page', 'Camera Title'),
              _buildOffstageNavigator(
                NavItem.chats,
                Icon(
                  Icons.chat,
                  size: 150,
                ),
                'Chats Page',
                'Chats Title',
              ),
            ]),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: _selectedIndex,
              items: _listItems
                  .map<BottomNavigationBarItem>((li) => li.bottomNavBarItem)
                  .toList(),
              onTap: (int index) {
                setState(() {
                  _selectedIndex = index;
                  _currentTab = _listItems[index].item;
                });
                BlocProvider.of<NavBloc>(context)
                    .add(NavigateTo(_listItems[index].item));
              },
            ),
          );
        },
      ),
    );
  }
}

final List<_NavigationItem> _listItems = [
  _NavigationItem(
      NavItem.calls,
      "Calls",
      BottomNavigationBarItem(
        icon: Icon(Icons.call),
        label: 'Calls',
      )),
  _NavigationItem(
      NavItem.camera,
      "Camera",
      BottomNavigationBarItem(
        icon: Icon(Icons.camera),
        label: 'Camera',
      )),
  _NavigationItem(
      NavItem.chats,
      "Chat",
      BottomNavigationBarItem(
        icon: Icon(Icons.chat),
        label: 'Chats',
      )),
];

class _NavigationItem {
  final NavItem item;
  final String title;
  final BottomNavigationBarItem bottomNavBarItem;
  _NavigationItem(this.item, this.title, this.bottomNavBarItem);
}
