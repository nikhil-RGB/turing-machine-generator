import 'package:hive_flutter/adapters.dart';
import 'package:turing_machines/models/Behaviour.dart';
import 'package:turing_machines/models/Configuration.dart';
import 'package:turing_machines/models/Tape.dart';
import 'package:turing_machines/models/TuringMachines.dart';
part "TuringMachineModel.g.dart";

@HiveType(typeId: 0)
class TuringMachineModel {
  @HiveField(0)
  int iterations;
  @HiveField(1)
  String initial_config;
  @HiveField(2)
  String current_config;
  @HiveField(3)
  Tape tape;
  @HiveField(4)
  List<Configuration> configs;
  @HiveField(5)
  List<Behaviour> behaviours;
  TuringMachineModel(
      {required this.iterations,
      required this.initial_config,
      required this.current_config,
      required this.tape,
      required this.configs,
      required this.behaviours});
  //Factory constructor for Model to save this machine object
  factory TuringMachineModel.fromMachine({required TuringMachine machine}) {
    //Construct object from machine object.
    return TuringMachineModel(
        iterations: machine.iterations,
        initial_config: machine.initial_config,
        current_config: machine.current_config,
        tape: machine.tape,
        configs: machine.machine.keys.toList(),
        behaviours: machine.machine.values.toList());
    //LinkedHashMap to List.
  }
  //Convert machine-model to machine.
  TuringMachine actuateMachine() {
    TuringMachine machine = TuringMachine(
      configs,
      behaviours,
      tape: tape,
      initial_config: initial_config,
    );
    machine.current_config = current_config;
    machine.iterations = iterations;
    return machine;
  }
}
