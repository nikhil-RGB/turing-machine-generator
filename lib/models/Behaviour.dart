import 'package:flutter/foundation.dart';
import 'package:turing_machines/models/Actions.dart';

class Behaviour {
  const Behaviour({required this.actions, required this.f_config});
  final List<Actions> actions;
  final String f_config;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Behaviour &&
          runtimeType == other.runtimeType &&
          listEquals(actions, other.actions) &&
          f_config == other.f_config;

  @override
  int get hashCode => actions.hashCode ^ f_config.hashCode;
}
