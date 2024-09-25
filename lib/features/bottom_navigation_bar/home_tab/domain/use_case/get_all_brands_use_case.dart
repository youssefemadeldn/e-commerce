import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/bottom_navigation_bar/home_tab/domain/entity/brands_entity.dart';
import 'package:e_commerce/features/bottom_navigation_bar/home_tab/domain/repo/base_home_tab_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllBrandsUseCase {
  BaseHomeTabRepo baseHomeTabRepo;

  GetAllBrandsUseCase({required this.baseHomeTabRepo});

  Future<Either<Failure, BrandsEntity>> invoke() async {
    return await baseHomeTabRepo.getAllBrands();
  }
}
