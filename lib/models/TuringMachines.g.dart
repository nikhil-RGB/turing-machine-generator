// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TuringMachines.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TuringMachineAdapter extends TypeAdapter<TuringMachine> {
  @override
  final int typeId = 0;

  @override
  TuringMachine read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TuringMachine(
      tape: fields[3] as Tape,
      initial_config: fields[1] as String,
    )
      ..iterations = fields[0] as int
      ..current_config = fields[2] as String
      ..machine = (fields[4] as Map).cast<Configuration, Behaviour>();
  }

  @override
  void write(BinaryWriter writer, TuringMachine obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.iterations)
      ..writeByte(1)
      ..write(obj.initial_config)
      ..writeByte(2)
      ..write(obj.current_config)
      ..writeByte(3)
      ..write(obj.tape)
      ..writeByte(4)
      ..write(obj.machine);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TuringMachineAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
