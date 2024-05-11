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
      iterations: fields[0] as int,
      initial_config: fields[1] as String,
      current_config: fields[2] as String,
      tape: fields[3] as Tape,
      configs: (fields[4] as List).cast<Configuration>(),
      behaviours: (fields[5] as List).cast<Behaviour>(),
    );
  }

  @override
  void write(BinaryWriter writer, TuringMachineModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.iterations)
      ..writeByte(1)
      ..write(obj.initial_config)
      ..writeByte(2)
      ..write(obj.current_config)
      ..writeByte(3)
      ..write(obj.tape)
      ..writeByte(4)
      ..write(obj.configs)
      ..writeByte(5)
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
