//TO-DO: Add exception handling for when a behaviour cannot be found for a certain key config,
//causing the machine to halt. This should be checked in the stepIntoConfiguration() function.
//Also implement a dialog box showing that the machine has halted.
// ignore_for_file: non_constant_identifier_names

import 'dart:collection';
import 'package:turing_machines/models/Behaviour.dart';
import 'package:turing_machines/models/Configuration.dart';
import 'package:turing_machines/models/Tape.dart';

//An object of this class represents a hypothetical turing machine, complete with a tape, m-configs, scanned symbols,Actions adn a final m-config post-action execution
class TuringMachine {
  int iterations = 0;
  String current_config;
  final List<Behaviour> behaviours;
  final List<Configuration> configurations;
  final Tape tape;
  late HashMap<Configuration, Behaviour> machine;
  TuringMachine(
      {required this.configurations,
      required this.behaviours,
      required this.tape,
      required this.current_config})
      : machine = HashMap() {
    //Write code to convert ordered entires into hashmap key-pair values
    // ignore: unnecessary_this
    for (int i = 0; i < this.configurations.length; i++) {
      Behaviour behaviour = behaviours[i];
      Configuration configuration = configurations[i];
      machine[configuration] = behaviour;
    }
  }

  //Updates the state of the turing machine by exactly one Configuration-Behavior pair computation.
  void stepIntoConfig() {
    Configuration key =
        Configuration(m_config: current_config, symbol: tape.symbol);
    //TO-DO:Override equals and hashcode functions for all composite data types to ensure proper key matching while referencing the hash map.
    //DONE: 3:51 AM 01-04-2024
    Behaviour value = machine[key]!;
    tape.process(value.actions);
    current_config = value.f_config;
    ++iterations;
    //machine has progressed and computed one <config,behaviour> pair
  }

  //resets the turing machine
  void reset() {
    //TO-DO:Implement reset() function for overall state of turing machine
    iterations = 0; //Reset iteration counter
    tape.reset(); //hard-reset the tape of the turing machine
    current_config =
        configurations[0].m_config; //set m-config to first one is the table
  }
}
