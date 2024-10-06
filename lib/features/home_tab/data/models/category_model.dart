import 'package:e_commerce/features/home_tab/domain/entity/category_entity.dart';

class CategoryModel extends CategoryEntity {
  Metadata? metadata;

  CategoryModel({super.results, this.metadata, super.data, super.message});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    results = json['results'];
    message = json['message'];
    metadata = json['metadata'] != null
        ? new Metadata.fromJson(json['metadata'])
        : null;
    if (json['data'] != null) {
      data = <DataCategoryModel>[];
      json['data'].forEach((v) {
        data!.add(new DataCategoryModel.fromJson(v));
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

class Metadata {
  int? currentPage;
  int? numberOfPages;
  int? limit;

  Metadata({this.currentPage, this.numberOfPages, this.limit});

  Metadata.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['currentPage'] = this.currentPage;
  //   data['numberOfPages'] = this.numberOfPages;
  //   data['limit'] = this.limit;
  //   return data;
  // }
}

class DataCategoryModel extends DataCategoryEntity {
  String? createdAt;
  String? updatedAt;

  DataCategoryModel(
      {super.sId,
      super.name,
      super.slug,
      super.image,
      this.createdAt,
      this.updatedAt});

  DataCategoryModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['_id'] = this.sId;
  //   data['name'] = this.name;
  //   data['slug'] = this.slug;
  //   data['image'] = this.image;
  //   data['createdAt'] = this.createdAt;
  //   data['updatedAt'] = this.updatedAt;
  //   return data;
  // }
}
