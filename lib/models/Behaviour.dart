import 'package:turing_machines/models/Actions.dart';

class Behaviour {
  const Behaviour({required this.actions, required this.f_config});
  final List<Actions> actions;
  final String f_config;
}
