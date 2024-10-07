import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/cart/domain/entities/get_items_in_cart_entity.dart';

abstract class BaseCartRepo {
  Future<Either<Failure, GetItemsInCartEntity>> getItemsInCart();
}
