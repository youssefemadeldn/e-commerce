class ProductsEntity {
  int? results;
  ProductMetadataEntity? metadata;
  List<ProductDataEntity>? data;

  ProductsEntity({this.results, this.metadata, this.data});
}

class ProductMetadataEntity {
  int? currentPage;
  int? numberOfPages;
  int? limit;
  int? nextPage;

  ProductMetadataEntity(
      {this.currentPage, this.numberOfPages, this.limit, this.nextPage});
}

class ProductDataEntity {
  int? sold;
  List<String>? images;
  List<ProductSubcategoryEntity>? subcategory;
  int? ratingsQuantity;
  String? sId;
  String? title;
  String? slug;
  String? description;
  int? quantity;
  int? price;
  String? imageCover;
  ProductCategoryEntity? category;
  ProductCategoryEntity? brand;
  double? ratingsAverage;
  String? createdAt;
  String? updatedAt;
  String? id;
  int? priceAfterDiscount;
  List<Null>? availableColors;

  ProductDataEntity({
    this.sold,
    this.images,
    this.subcategory,
    this.ratingsQuantity,
    this.sId,
    this.title,
    this.slug,
    this.description,
    this.quantity,
    this.price,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
    this.createdAt,
    this.updatedAt,
    this.id,
    this.priceAfterDiscount,
    this.availableColors,
  });
}

class ProductSubcategoryEntity {
  String? sId;
  String? name;
  String? slug;
  String? category;

  ProductSubcategoryEntity({this.sId, this.name, this.slug, this.category});
}

class ProductCategoryEntity {
  String? sId;
  String? name;
  String? slug;
  String? image;

  ProductCategoryEntity({this.sId, this.name, this.slug, this.image});
}
