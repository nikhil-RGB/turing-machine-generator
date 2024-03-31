// ignore: file_names

import 'package:turing_machines/exceptions/action_exceptions.dart';

//Represents an Action which can be performed on the tape of a turing machine.
class Actions {
  String symbol;
  ActionType type;
  Actions({required this.type, this.symbol = ""});
  //Parses a String containing actions, seperated by a ,(comma)
  static List<Actions> parseActions(String input) {
    input = input.replaceAll(" ", "");
    List<String> tokens = input.split(',');
    List<Actions> actions = [];
    for (String token in tokens) {
      ActionType type;
      String symbol = "";
      if (token == "L") {
        type = ActionType.L;
      } else if (token == "R") {
        type = ActionType.R;
      } else if (token == "E") {
        type = ActionType.E;
      } else if (token[0] == "P" && token.length == 2) {
        type = ActionType.P;
        symbol = token[1];
      } else {
        type = ActionType.NONE;
        throw ActionParserException("$token is not a valid action!");
      }
      Actions object = Actions(type: type, symbol: symbol);
      actions.add(object);
    }
    return actions;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Actions &&
          runtimeType == other.runtimeType &&
          symbol == other.symbol &&
          type == other.type;

  @override
  int get hashCode => symbol.hashCode ^ type.hashCode;
}

enum ActionType {
  P,
  R,
  L,
  E,
  // ignore: constant_identifier_names
  NONE;
}
