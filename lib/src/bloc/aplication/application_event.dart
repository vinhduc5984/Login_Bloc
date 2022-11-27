import 'package:flutter/material.dart';

abstract class ApplicationEvent {}

class OnSetupApplication extends ApplicationEvent {
  final BuildContext context;
  OnSetupApplication(this.context);
}
