import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/home_tab/domain/entity/category_entity.dart';
import 'package:e_commerce/features/home_tab/domain/repo/base_home_tab_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllCategoriesUseCase {
  BaseHomeTabRepo baseHomeTabRepo;

  GetAllCategoriesUseCase({required this.baseHomeTabRepo});

  Future<Either<Failure, CategoryEntity>> invoke() async {
    return await baseHomeTabRepo.getAllCategories();
  }
}
