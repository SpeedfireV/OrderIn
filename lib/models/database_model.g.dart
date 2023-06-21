// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FoodItemDbAdapter extends TypeAdapter<FoodItemDb> {
  @override
  final int typeId = 1;

  @override
  FoodItemDb read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FoodItemDb(
      name: fields[0] as String,
      price: fields[1] as int,
      extras: fields[2] as bool,
      addTime: fields[3] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, FoodItemDb obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.extras)
      ..writeByte(3)
      ..write(obj.addTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FoodItemDbAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
