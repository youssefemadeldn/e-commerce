import 'package:e_commerce/features/home_tab/domain/entity/brands_entity.dart';

class BrandsModel extends BrandsEntity {
  String? statusMsg;
  String? message;
  BrandsModel({
    super.results,
    super.metadata,
    super.data,
    this.message,
    this.statusMsg,
  });

  BrandsModel.fromJson(Map<String, dynamic> json) {
    results = json['results'];
    message = json['message'];
    statusMsg = json['statusMsg'];
    metadata = json['metadata'] != null
        ? new MetadataModel.fromJson(json['metadata'])
        : null;
    if (json['data'] != null) {
      data = <DataBrandsModel>[];
      json['data'].forEach((v) {
        data!.add(new DataBrandsModel.fromJson(v));
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

class MetadataModel extends MetadataEntity {
  MetadataModel(
      {super.currentPage, super.numberOfPages, super.limit, super.nextPage});

  MetadataModel.fromJson(Map<String, dynamic> json) {
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

class DataBrandsModel extends DataBrandsEntity {
  String? createdAt;
  String? updatedAt;

  DataBrandsModel(
      {super.sId,
      super.name,
      super.slug,
      super.image,
      this.createdAt,
      this.updatedAt});

  DataBrandsModel.fromJson(Map<String, dynamic> json) {
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
