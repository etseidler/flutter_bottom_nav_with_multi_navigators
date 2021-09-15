import 'nav_state.dart';

abstract class NavEvent {
  const NavEvent();
}

class NavigateTo extends NavEvent {
  final NavItem destination;
  const NavigateTo(this.destination);
}
