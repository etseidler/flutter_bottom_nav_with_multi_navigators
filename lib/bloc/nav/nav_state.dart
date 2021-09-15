class NavState {
  final NavItem selectedItem;
  const NavState(this.selectedItem);
}

enum NavItem {
  go_back,
  calls,
  camera,
  camera2,
  chats,
}
