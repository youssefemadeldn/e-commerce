import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/bottom_navigation_bar/domain/entities/add_to_cart_entity.dart';
import 'package:e_commerce/features/bottom_navigation_bar/domain/repo/base_bottom_navigation_bar_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddToCartUseCase {
  BaseBottomNavigationBarRepo baseBottomNavigationBarRepo;

  AddToCartUseCase({required this.baseBottomNavigationBarRepo});

  Future<Either<Failure, AddToCartEntity>> invoke(String productId) async {
    return await baseBottomNavigationBarRepo.addToCart(productId);
  }
}
