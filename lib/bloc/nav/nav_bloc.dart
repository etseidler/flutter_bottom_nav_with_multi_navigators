import 'package:flutter_bloc/flutter_bloc.dart';
import 'nav_event.dart';
import 'nav_state.dart';

class NavBloc extends Bloc<NavEvent, NavState> {
  NavBloc() : super(NavState(NavItem.calls));

  @override
  Stream<NavState> mapEventToState(NavEvent event) async* {
    if (event is NavigateTo) {
      if (event.destination != state.selectedItem) {
        yield NavState(event.destination);
      }
    }
  }

  @override
  void onChange(Change<NavState> change) {
    // TODO: implement onChange
    print(change);
  }
}
