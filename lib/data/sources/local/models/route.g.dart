// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RouteHiveModelAdapter extends TypeAdapter<RouteHiveModel> {
  @override
  final int typeId = 3;

  @override
  RouteHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RouteHiveModel(
      fields[0] as int,
      fields[1] as int,
      (fields[2] as List).cast<BusStopHiveModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, RouteHiveModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.routeId)
      ..writeByte(1)
      ..write(obj.direction)
      ..writeByte(2)
      ..write(obj.stops);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RouteHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
