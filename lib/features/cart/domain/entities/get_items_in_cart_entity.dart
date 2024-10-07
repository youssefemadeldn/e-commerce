import 'package:equatable/equatable.dart';

class GetItemsInCartEntity extends Equatable {
  String? status;
  int? numOfCartItems;
  String? cartId;
  DataGetItemsInCartEntity? data;

  GetItemsInCartEntity(
      {this.status, this.numOfCartItems, this.cartId, this.data});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class DataGetItemsInCartEntity extends Equatable {
  String? sId;
  String? cartOwner;
  List<ProductsEntity>? products;
  String? createdAt;
  String? updatedAt;
  int? iV;
  int? totalCartPrice;

  DataGetItemsInCartEntity({
    this.sId,
    this.cartOwner,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.iV,
    this.totalCartPrice,
  });

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class ProductsEntity extends Equatable {
  int? count;
  String? sId;
  ProductEntity? product;
  int? price;

  ProductsEntity({this.count, this.sId, this.product, this.price});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class ProductEntity extends Equatable {
  List<SubcategoryEntity>? subcategory;
  String? sId;
  String? title;
  int? quantity;
  String? imageCover;
  CategoryEntity? category;
  CategoryEntity? brand;
  double? ratingsAverage;
  String? id;

  ProductEntity(
      {this.subcategory,
      this.sId,
      this.title,
      this.quantity,
      this.imageCover,
      this.category,
      this.brand,
      this.ratingsAverage,
      this.id});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class SubcategoryEntity extends Equatable {
  String? sId;
  String? name;
  String? slug;
  String? category;

  SubcategoryEntity({this.sId, this.name, this.slug, this.category});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class CategoryEntity extends Equatable {
  String? sId;
  String? name;
  String? slug;
  String? image;

  CategoryEntity({this.sId, this.name, this.slug, this.image});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
