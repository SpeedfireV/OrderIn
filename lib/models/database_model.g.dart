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
      amount: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, FoodItemDb obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.extras)
      ..writeByte(3)
      ..write(obj.addTime)
      ..writeByte(4)
      ..write(obj.amount);
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

class ProfileDbAdapter extends TypeAdapter<ProfileDb> {
  @override
  final int typeId = 2;

  @override
  ProfileDb read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProfileDb(
      name: fields[0] as String,
      street: fields[1] as String,
      phone: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ProfileDb obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.street)
      ..writeByte(2)
      ..write(obj.phone);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProfileDbAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
