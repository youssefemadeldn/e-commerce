import 'package:e_commerce/features/bottom_navigation_bar/domain/entities/add_to_cart_entity.dart';

class AddToCartModel extends AddToCartEntity {
  String? statusMsg;
  AddToCartModel(
      {this.statusMsg,
      super.status,
      super.message,
      super.numOfCartItems,
      super.cartId,
      super.data});

  AddToCartModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusMsg = json['statusMsg'];
    message = json['message'];
    numOfCartItems = json['numOfCartItems'];
    cartId = json['cartId'];
    data = json['data'] != null ? DataCartModel.fromJson(json['data']) : null;
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['status'] = this.status;
  //   data['message'] = this.message;
  //   data['numOfCartItems'] = this.numOfCartItems;
  //   data['cartId'] = this.cartId;
  //   if (this.data != null) {
  //     data['data'] = this.data!.toJson();
  //   }
  //   return data;
  // }
}

class DataCartModel extends DataCartEntity {
  DataCartModel(
      {super.sId,
      super.cartOwner,
      super.products,
      super.createdAt,
      super.updatedAt,
      super.iV,
      super.totalCartPrice});

  DataCartModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = <ProductsModel>[];
      json['products'].forEach((v) {
        products!.add(ProductsModel.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['_id'] = this.sId;
  //   data['cartOwner'] = this.cartOwner;
  //   if (this.products != null) {
  //     data['products'] = this.products!.map((v) => v.toJson()).toList();
  //   }
  //   data['createdAt'] = this.createdAt;
  //   data['updatedAt'] = this.updatedAt;
  //   data['__v'] = this.iV;
  //   data['totalCartPrice'] = this.totalCartPrice;
  //   return data;
  // }
}

class ProductsModel extends ProductsEntity {
  ProductsModel({super.count, super.sId, super.product, super.price});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    sId = json['_id'];
    product = json['product'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['count'] = count;
    data['_id'] = sId;
    data['product'] = product;
    data['price'] = price;
    return data;
  }
}
