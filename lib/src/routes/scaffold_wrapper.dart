// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class ScaffoldWrapper extends StatefulWidget {
  final Widget child;

  const ScaffoldWrapper({
    required this.child,
  });

  @override
  // ignore: library_private_types_in_public_api
  _ScaffoldWrapperState createState() => _ScaffoldWrapperState();
}

class _ScaffoldWrapperState extends State<ScaffoldWrapper> {
  _hideKeyboard() {
    if (FocusScope.of(context).hasFocus) {
      FocusScope.of(context).unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: _child,
    );
  }

  Widget get _child {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: _getBody,
    );
  }

  Widget get _getBody {
    return GestureDetector(
      onTap: () => _hideKeyboard(),
      child: widget.child,
    );
  }
}
