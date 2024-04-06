class Configuration {
  const Configuration({required this.m_config, required this.symbol});
  final String m_config;
  final String symbol;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Configuration &&
          runtimeType == other.runtimeType &&
          m_config == other.m_config &&
          ((symbol == other.symbol) ||
              (symbol.toLowerCase() == "any") ||
              (other.symbol.toLowerCase() == "any"));

  @override
  int get hashCode => m_config.hashCode ^ symbol.hashCode;
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
  }
  return input;
}
