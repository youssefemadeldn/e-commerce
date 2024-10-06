import 'package:equatable/equatable.dart';

class AddToCartEntity extends Equatable {
  String? status;
  String? message;
  int? numOfCartItems;
  String? cartId;
  DataCartEntity? data;

  AddToCartEntity(
      {this.status, this.message, this.numOfCartItems, this.cartId, this.data});

  @override
  List<Object?> get props => [
        status,
        message,
        numOfCartItems,
        cartId,
        data,
      ];
}

class DataCartEntity extends Equatable {
  String? sId;
  String? cartOwner;
  List<ProductsEntity>? products;
  String? createdAt;
  String? updatedAt;
  int? iV;
  int? totalCartPrice;

  DataCartEntity(
      {this.sId,
      this.cartOwner,
      this.products,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.totalCartPrice});

  @override
  List<Object?> get props => [
        sId,
        cartOwner,
        products,
        createdAt,
        updatedAt,
        iV,
        totalCartPrice,
      ];
}

class ProductsEntity {
  int? count;
  String? sId;
  String? product;
  int? price;

  ProductsEntity({this.count, this.sId, this.product, this.price});
}
