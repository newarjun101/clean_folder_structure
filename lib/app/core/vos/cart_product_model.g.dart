// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_product_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CartProductModelAdapter extends TypeAdapter<CartProductModel> {
  @override
  final int typeId = 0;

  @override
  CartProductModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CartProductModel(
      productId: fields[0] as int,
      productName: fields[2] as String,
      amount: fields[3] as dynamic,
      quantity: fields[4] as int,
      image: fields[6] as String,
      lineTotal: fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, CartProductModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.productId)
      ..writeByte(2)
      ..write(obj.productName)
      ..writeByte(3)
      ..write(obj.amount)
      ..writeByte(4)
      ..write(obj.quantity)
      ..writeByte(5)
      ..write(obj.lineTotal)
      ..writeByte(6)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartProductModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
