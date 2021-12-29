// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'departure_time.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DepartureTimeHiveModelAdapter
    extends TypeAdapter<DepartureTimeHiveModel> {
  @override
  final int typeId = 2;

  @override
  DepartureTimeHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DepartureTimeHiveModel(
      fields[0] as int,
      fields[1] as String,
      fields[2] as int,
      fields[3] as bool,
      fields[4] as bool,
      fields[5] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, DepartureTimeHiveModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.clock)
      ..writeByte(2)
      ..write(obj.order)
      ..writeByte(3)
      ..write(obj.accessible)
      ..writeByte(4)
      ..write(obj.bike)
      ..writeByte(5)
      ..write(obj.electric);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DepartureTimeHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
