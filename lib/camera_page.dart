import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nested_nav/bloc/nav/nav_state.dart';

import 'bloc/nav/nav_bloc.dart';
import 'bloc/nav/nav_event.dart';
// import 'package:nested_nav/index.dart';

class CameraPage extends StatefulWidget {
  static const String routeName = '/camera';

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  // final _cameraBloc = CameraBloc(UnCameraState());

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.camera,
      size: 150,
    );
  }
}
