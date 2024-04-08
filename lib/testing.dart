import 'package:turing_machines/models/Actions.dart';
import 'package:turing_machines/models/Behaviour.dart';
import 'package:turing_machines/models/Configuration.dart';
import 'package:turing_machines/models/Tape.dart';
import 'package:turing_machines/models/TuringMachines.dart';

class Testing {
  static TuringMachine _continuousZeroPrint() {
    //Create and test turing machine to print 0 continuously
    List<Configuration> configurations = [
      Configuration(m_config: "B", symbol: ""),
      Configuration(m_config: "Q", symbol: ""),
      Configuration(m_config: "Q", symbol: "0"),
    ];

    List<Behaviour> behaviours = [
      Behaviour(actions: Actions.parseActions("P0,R"), f_config: "Q"),
      Behaviour(actions: Actions.parseActions("L"), f_config: "Q"),
      Behaviour(actions: Actions.parseActions("R,P0"), f_config: "Q"),
    ];
    TuringMachine machine = TuringMachine(configurations, behaviours,
        tape: Tape(), initial_config: "B");
    return machine;
  }

  static TuringMachine main() {
    TuringMachine machine = _continuousZeroPrint();
    // machine.tape.printTape();
    // for (int i = 0; i < 10; i++) {
    //   machine.stepIntoConfig();
    //   machine.tape.printTape();
    // }
    return machine;
  }
}
