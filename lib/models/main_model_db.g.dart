// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_model_db.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MainModelDBAdapter extends TypeAdapter<MainModelDB> {
  @override
  final int typeId = 0;

  @override
  MainModelDB read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MainModelDB(
      name: fields[0] as String,
      imgName: fields[1] as String,
      badgeCount: fields[2] as int,
      items: (fields[4] as List).cast<Item>(),
      isSelected: fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, MainModelDB obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.imgName)
      ..writeByte(2)
      ..write(obj.badgeCount)
      ..writeByte(3)
      ..write(obj.isSelected)
      ..writeByte(4)
      ..write(obj.items);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MainModelDBAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ItemAdapter extends TypeAdapter<Item> {
  @override
  final int typeId = 1;

  @override
  Item read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Item(
      name: fields[0] as String,
      desc: fields[1] as String,
      imgPath: fields[2] as String,
      price: fields[3] as double,
      discount: fields[4] as double,
      qty: fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Item obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.desc)
      ..writeByte(2)
      ..write(obj.imgPath)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.discount)
      ..writeByte(5)
      ..write(obj.qty);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
