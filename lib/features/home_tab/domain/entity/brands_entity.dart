import 'package:equatable/equatable.dart';

class BrandsEntity extends Equatable {
  int? results;
  MetadataEntity? metadata;
  List<DataBrandsEntity>? data;

  BrandsEntity({
    this.results,
    this.metadata,
    this.data,
  });

  @override
  List<Object?> get props => [
        results,
        metadata,
        data,
      ];
}

class MetadataEntity extends Equatable {
  int? currentPage;
  int? numberOfPages;
  int? limit;
  int? nextPage;

  MetadataEntity({
    this.currentPage,
    this.numberOfPages,
    this.limit,
    this.nextPage,
  });

  @override
  List<Object?> get props => [
        currentPage,
        numberOfPages,
        limit,
        nextPage,
      ];
}

class DataBrandsEntity extends Equatable {
  String? sId;
  String? name;
  String? slug;
  String? image;

  DataBrandsEntity({
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
