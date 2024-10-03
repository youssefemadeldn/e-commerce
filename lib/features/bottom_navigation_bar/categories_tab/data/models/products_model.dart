import 'package:e_commerce/features/bottom_navigation_bar/categories_tab/domain/entity/products_enity.dart';

class ProductsModel extends ProductsEntity {
  String? statusMsg;
  String? message;
  ProductsModel(
      {this.statusMsg,
      this.message,
      super.results,
      super.metadata,
      super.data});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    results = json['results'];
    message = json['message'];
    statusMsg = json['statusMsg'];
    metadata = json['metadata'] != null
        ? new ProductsMetadata.fromJson(json['metadata'])
        : null;
    if (json['data'] != null) {
      data = <ProductDataModel>[];
      json['data'].forEach((v) {
        data!.add(new ProductDataModel.fromJson(v));
      });
    }
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['results'] = this.results;
  //   if (this.metadata != null) {
  //     data['metadata'] = this.metadata!.toJson();
  //   }
  //   if (this.data != null) {
  //     data['data'] = this.data!.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}

class ProductsMetadata extends ProductMetadataEntity {
  ProductsMetadata(
      {super.currentPage, super.numberOfPages, super.limit, super.nextPage});

  ProductsMetadata.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
    nextPage = json['nextPage'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['currentPage'] = this.currentPage;
  //   data['numberOfPages'] = this.numberOfPages;
  //   data['limit'] = this.limit;
  //   data['nextPage'] = this.nextPage;
  //   return data;
  // }
}

class ProductDataModel extends ProductDataEntity {
  ProductDataModel(
      {super.sold,
      super.images,
      super.subcategory,
      super.ratingsQuantity,
      super.sId,
      super.title,
      super.slug,
      super.description,
      super.quantity,
      super.price,
      super.imageCover,
      super.category,
      super.brand,
      super.ratingsAverage,
      super.createdAt,
      super.updatedAt,
      super.id,
      super.priceAfterDiscount,
      super.availableColors});

  ProductDataModel.fromJson(Map<String, dynamic> json) {
    sold = json['sold'];
    images = json['images'].cast<String>();
    if (json['subcategory'] != null) {
      subcategory = <ProductSubcategoryModel>[];
      json['subcategory'].forEach((v) {
        subcategory!.add(new ProductSubcategoryModel.fromJson(v));
      });
    }
    ratingsQuantity = json['ratingsQuantity'];
    sId = json['_id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    quantity = json['quantity'];
    price = json['price'];
    imageCover = json['imageCover'];
    category = json['category'] != null
        ? new ProductCategoryModel.fromJson(json['category'])
        : null;
    brand = json['brand'] != null
        ? new ProductCategoryModel.fromJson(json['brand'])
        : null;
    ratingsAverage = json['ratingsAverage'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    id = json['id'];
    priceAfterDiscount = json['priceAfterDiscount'];
    if (json['availableColors'] != null) {
      availableColors = <Null>[];
    }
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['sold'] = this.sold;
  //   data['images'] = this.images;
  //   if (this.subcategory != null) {
  //     data['subcategory'] = this.subcategory!.map((v) => v.toJson()).toList();
  //   }
  //   data['ratingsQuantity'] = this.ratingsQuantity;
  //   data['_id'] = this.sId;
  //   data['title'] = this.title;
  //   data['slug'] = this.slug;
  //   data['description'] = this.description;
  //   data['quantity'] = this.quantity;
  //   data['price'] = this.price;
  //   data['imageCover'] = this.imageCover;
  //   if (this.category != null) {
  //     data['category'] = this.category!.toJson();
  //   }
  //   if (this.brand != null) {
  //     data['brand'] = this.brand!.toJson();
  //   }
  //   data['ratingsAverage'] = this.ratingsAverage;
  //   data['createdAt'] = this.createdAt;
  //   data['updatedAt'] = this.updatedAt;
  //   data['id'] = this.id;
  //   data['priceAfterDiscount'] = this.priceAfterDiscount;
  //   if (this.availableColors != null) {
  //     data['availableColors'] =
  //         this.availableColors!.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}

class ProductSubcategoryModel extends ProductSubcategoryEntity {
  ProductSubcategoryModel({super.sId, super.name, super.slug, super.category});

  ProductSubcategoryModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['_id'] = this.sId;
  //   data['name'] = this.name;
  //   data['slug'] = this.slug;
  //   data['category'] = this.category;
  //   return data;
  // }
}

class ProductCategoryModel extends ProductCategoryEntity {
  ProductCategoryModel({super.sId, super.name, super.slug, super.image});

  ProductCategoryModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['_id'] = this.sId;
  //   data['name'] = this.name;
  //   data['slug'] = this.slug;
  //   data['image'] = this.image;
  //   return data;
  // }
}
