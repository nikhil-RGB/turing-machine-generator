// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TuringMachineModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TuringMachineModelAdapter extends TypeAdapter<TuringMachineModel> {
  @override
  final int typeId = 0;

  @override
  TuringMachineModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TuringMachineModel(
      initial_config: fields[0] as String,
      configs: (fields[1] as List).cast<Configuration>(),
      behaviours: (fields[2] as List).cast<Behaviour>(),
    );
  }

  @override
  void write(BinaryWriter writer, TuringMachineModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.initial_config)
      ..writeByte(1)
      ..write(obj.configs)
      ..writeByte(2)
      ..write(obj.behaviours);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TuringMachineModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
