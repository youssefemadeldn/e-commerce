import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/home_tab/data/data_source/remote/base_remote_home_tab_data_source.dart';
import 'package:e_commerce/features/home_tab/domain/entity/brands_entity.dart';
import 'package:e_commerce/features/home_tab/domain/entity/category_entity.dart';
import 'package:e_commerce/features/home_tab/domain/repo/base_home_tab_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BaseHomeTabRepo)
class HomeTabRepoImpl implements BaseHomeTabRepo {
  BaseRemoteHomeTabDataSource baseRemoteHomeTabDataSource;
  HomeTabRepoImpl({required this.baseRemoteHomeTabDataSource});
  @override
  Future<Either<Failure, CategoryEntity>> getAllCategories() async {
    var either = await baseRemoteHomeTabDataSource.getAllCategories();

    return either.fold(
      (failure) => left(failure),
      (categoryModel) => Right(categoryModel),
    );
  }

  @override
  Future<Either<Failure, BrandsEntity>> getAllBrands() async {
    var either = await baseRemoteHomeTabDataSource.getAllBrands();

    return either.fold(
      (failure) => Left(failure),
      (brandsModel) => Right(brandsModel),
    );
  }
}
