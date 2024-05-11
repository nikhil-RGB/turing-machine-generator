// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Behaviour.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BehaviourAdapter extends TypeAdapter<Behaviour> {
  @override
  final int typeId = 3;

  @override
  Behaviour read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Behaviour(
      actions: (fields[0] as List).cast<Actions>(),
      f_config: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Behaviour obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.actions)
      ..writeByte(1)
      ..write(obj.f_config);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BehaviourAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
