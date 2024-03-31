import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:turing_machines/models/Configuration.dart';

class TuringMachine {
  final List<Actions> actions;
  final List<Configuration> configuration;
  late HashMap<Configuration, Action> machine;
  TuringMachine({required this.configuration, required this.actions}) {
    //Write code to convert ordered entires into hashmap key-pair values
  }
}
