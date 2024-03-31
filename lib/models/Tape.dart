import 'package:turing_machines/exceptions/action_exceptions.dart';
import 'package:turing_machines/models/Actions.dart';

class Tape {
  List<String> tape = ["", "", "", "", "", "", "", "", "", ""];
  int pointer = 0;
  //getter function for current symbol being scanned
  String get symbol => tape[pointer];
  //Processes a set of actions requested to be performed on the tape.
  void process(List<Actions> actions) {
    for (Actions action in actions) {
      switch (action.type) {
        case ActionType.L:
          if (pointer == 0) {
            throw const TapeOperationException("Cannot Move Left beyond 0");
          }
          --pointer;
          //Move Pointer left
          break;
        case ActionType.R:
          if (pointer == (tape.length - 1)) {
            tape.add("");
          }
          ++pointer;
          //Move pointer right
          break;
        //Erase pointer position symbol
        case ActionType.E:
          tape[pointer] = "";
          //Erase symbol at current pointer position
          break;
        case ActionType.P:
          //Print symbol specified in current Action object
          tape[pointer] = action.symbol;
          break;
        case ActionType.NONE:
          throw const TapeOperationException("NONE is not a valid operation");
      }
    }
  }
}
