// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bus_stop.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BusStopHiveModelAdapter extends TypeAdapter<BusStopHiveModel> {
  @override
  final int typeId = 4;

  @override
  BusStopHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BusStopHiveModel(
      fields[0] as int,
      fields[1] as String,
      fields[2] as double,
      fields[3] as double,
      fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BusStopHiveModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.stopId)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.x)
      ..writeByte(3)
      ..write(obj.y)
      ..writeByte(4)
      ..write(obj.stopBuses);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BusStopHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
