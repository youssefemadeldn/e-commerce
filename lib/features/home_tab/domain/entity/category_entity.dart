import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  int? results;
  String? message;
  List<DataCategoryEntity>? data;

  CategoryEntity({
    this.results,
    this.data,
    this.message,
  });

  @override
  List<Object?> get props => [
        results,
        data,
        message,
      ];
}

class DataCategoryEntity extends Equatable {
  String? sId;
  String? name;
  String? slug;
  String? image;

  DataCategoryEntity({
    this.sId,
    this.name,
    this.slug,
    this.image,
  });

  @override
  List<Object?> get props => [
        sId,
        name,
        slug,
        image,
      ];
}
