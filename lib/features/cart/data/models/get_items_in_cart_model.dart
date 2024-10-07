import 'package:e_commerce/features/cart/domain/entities/get_items_in_cart_entity.dart';

class GetItemsInCartModel extends GetItemsInCartEntity {
  String? statusMsg;
  String? message;
  GetItemsInCartModel(
      {this.message,
      this.statusMsg,
      super.status,
      super.numOfCartItems,
      super.cartId,
      super.data});

  GetItemsInCartModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    statusMsg = json['statusMsg'];
    numOfCartItems = json['numOfCartItems'];
    cartId = json['cartId'];
    data = json['data'] != null
        ? new DataGetItemsInCartModel.fromJson(json['data'])
        : null;
  }
}

class DataGetItemsInCartModel extends DataGetItemsInCartEntity {
  DataGetItemsInCartModel(
      {super.sId,
      super.cartOwner,
      super.products,
      super.createdAt,
      super.updatedAt,
      super.iV,
      super.totalCartPrice});

  DataGetItemsInCartModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = <ProductsModel>[];
      json['products'].forEach((v) {
        products!.add(new ProductsModel.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }
}

class ProductsModel extends ProductsEntity {
  ProductsModel({super.count, super.sId, super.product, super.price});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    sId = json['_id'];
    product = json['product'] != null
        ? new ProductModel.fromJson(json['product'])
        : null;
    price = json['price'];
  }
}

class ProductModel extends ProductEntity {
  ProductModel(
      {super.subcategory,
      super.sId,
      super.title,
      super.quantity,
      super.imageCover,
      super.category,
      super.brand,
      super.ratingsAverage,
      super.id});

  ProductModel.fromJson(Map<String, dynamic> json) {
    if (json['subcategory'] != null) {
      subcategory = <SubcategoryModel>[];
      json['subcategory'].forEach((v) {
        subcategory!.add(new SubcategoryModel.fromJson(v));
      });
    }
    sId = json['_id'];
    title = json['title'];
    quantity = json['quantity'];
    imageCover = json['imageCover'];
    category = json['category'] != null
        ? new CategoryModel.fromJson(json['category'])
        : null;
    brand = json['brand'] != null
        ? new CategoryModel.fromJson(json['brand'])
        : null;
    ratingsAverage = json['ratingsAverage'];
    id = json['id'];
  }
}

class SubcategoryModel extends SubcategoryEntity {
  SubcategoryModel({super.sId, super.name, super.slug, super.category});

  SubcategoryModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'];
  }
}

class CategoryModel extends CategoryEntity {
  CategoryModel({super.sId, super.name, super.slug, super.image});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }
}
