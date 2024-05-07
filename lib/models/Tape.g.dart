// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Tape.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TapeAdapter extends TypeAdapter<Tape> {
  @override
  final int typeId = 1;

  @override
  Tape read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Tape(
      tape: (fields[0] as List).cast<String>(),
      pointer: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Tape obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.tape)
      ..writeByte(1)
      ..write(obj.pointer);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TapeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
