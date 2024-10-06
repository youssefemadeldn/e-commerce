import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/bottom_navigation_bar/domain/entities/add_to_cart_entity.dart';

abstract class BaseRemoteBottomNavigationBarDataSource {
  Future<Either<Failure, AddToCartEntity>> addToCart(String productId);
}
