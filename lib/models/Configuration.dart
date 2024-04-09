class Configuration {
  const Configuration({required this.m_config, required this.symbol});
  //Build a Configuration object by parsing a given String containing the
  //m-config and scanned symbol.
  //NOTE: The format should be: m-config, symbol
  //If symbol is NONE, it will be processed NORMALLY.
  factory Configuration.fromString(String input) {
    List<String> components = input.split(",").map((e) => e.trim()).toList();
    return Configuration(
        m_config: components[0], symbol: parseSymbolInput(components[1]));
  }
  final String m_config;
  final String symbol;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Configuration &&
          runtimeType == other.runtimeType &&
          m_config == other.m_config &&
          ((symbol == other.symbol) ||
              (symbol.toLowerCase() == "any" && other.symbol != "") ||
              (other.symbol.toLowerCase() == "any" && symbol != ""));

  @override
  int get hashCode => m_config.hashCode ^ symbol.hashCode;

  // int _symbolHashCode(String symbol) =>
  //     symbol.toLowerCase() == "any" ? 42 : symbol.hashCode;

  @override
  String toString() {
    return "$m_config, ${parseSymbolOutput(symbol)}";
  }
}

//Parse symbol output,convert "" to "NONE" else no change
String parseSymbolOutput(String output) {
  if (output.isEmpty) {
    return "NONE";
  }
  return output;
}

//Parse symbol input, convert NONE to "" else no change
String parseSymbolInput(String input) {
  if (input.toLowerCase() == "none") {
    return "";
  } else if (input.toLowerCase() == "any") {
    return "ANY";
  }
  return input;
}
