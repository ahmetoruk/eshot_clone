// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'departure.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DepartureHiveModelAdapter extends TypeAdapter<DepartureHiveModel> {
  @override
  final int typeId = 1;

  @override
  DepartureHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DepartureHiveModel(
      fields[0] as int,
      fields[1] as int,
      (fields[2] as List).cast<DepartureTimeHiveModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, DepartureHiveModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.routeId)
      ..writeByte(1)
      ..write(obj.direction)
      ..writeByte(2)
      ..write(obj.departureTimes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DepartureHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
