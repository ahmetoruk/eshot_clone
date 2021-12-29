// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_info.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RouteInfoHiveModelAdapter extends TypeAdapter<RouteInfoHiveModel> {
  @override
  final int typeId = 0;

  @override
  RouteInfoHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RouteInfoHiveModel(
      fields[0] as int,
      fields[1] as int,
      fields[2] as int,
      fields[3] as String,
      fields[4] as String,
      fields[5] as String,
      fields[6] as String,
      fields[7] as String,
      fields[8] as String,
      fields[9] as String,
      fields[10] as String,
    );
  }

  @override
  void write(BinaryWriter writer, RouteInfoHiveModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.routeId)
      ..writeByte(1)
      ..write(obj.routeNum)
      ..writeByte(2)
      ..write(obj.himRouteId)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.routeStart)
      ..writeByte(6)
      ..write(obj.routeEnd)
      ..writeByte(7)
      ..write(obj.workHoursStart)
      ..writeByte(8)
      ..write(obj.workHoursEnd)
      ..writeByte(9)
      ..write(obj.searchName)
      ..writeByte(10)
      ..write(obj.fare);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RouteInfoHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
