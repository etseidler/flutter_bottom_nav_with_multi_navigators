import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nested_nav/bloc/nav/simple_detail.dart';
import 'package:nested_nav/bloc/tab_navigator.dart';
import 'package:nested_nav/camera_page.dart';

import 'bloc/nav/nav_bloc.dart';
import 'bloc/nav/nav_event.dart';
import 'bloc/nav/nav_state.dart';

class BasicBottomNavBar extends StatefulWidget {
  const BasicBottomNavBar({Key? key}) : super(key: key);

  @override
  _BasicBottomNavBarState createState() => _BasicBottomNavBarState();
}

class _BasicBottomNavBarState extends State<BasicBottomNavBar> {
  static Map<NavItem, Widget> _pages = {
    NavItem.calls: Icon(
      Icons.call,
      size: 150,
    ),
    NavItem.camera: CameraPage(),
    // NavItem.camera2: Icon(
    //   Icons.ac_unit,
    //   size: 150,
    // ),
    NavItem.chats: Icon(
      Icons.chat,
      size: 150,
    )
  };
  int _selectedIndex = 0;

  final navigatorKey = GlobalKey<NavigatorState>();

  void _push() {
    Navigator.of(context).push(MaterialPageRoute(
      // we'll look at ColorDetailPage later
      builder: (context) =>
          SimpleDetailPage(text: 'Detail Text', title: 'DetailTitle'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NavBloc>(
      create: (context) => NavBloc(),
      child: BlocBuilder<NavBloc, NavState>(
        builder: (context, state) {
          return Scaffold(
            // appBar: AppBar(
            //   title: const Text('BottomNavigationBar Demo'),
            // ),
            // body: Center(
            //   child: _pages[state.selectedItem],
            // ),
            body: TabNavigator(
              navigatorKey: navigatorKey,
              navItem: state.selectedItem,
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: _selectedIndex,
              items: _listItems
                  .map<BottomNavigationBarItem>((li) => li.bottomNavBarItem)
                  .toList(),
              onTap: (int index) {
                setState(() {
                  _selectedIndex = index;
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
  // _NavigationItem(
  //     NavItem.camera2,
  //     "Camera 2",
  //     BottomNavigationBarItem(
  //       icon: Icon(Icons.camera),
  //       label: 'Camera',
  //     )),
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
