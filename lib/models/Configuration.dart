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
          symbol == other.symbol;

  @override
  int get hashCode => m_config.hashCode ^ symbol.hashCode;
}
