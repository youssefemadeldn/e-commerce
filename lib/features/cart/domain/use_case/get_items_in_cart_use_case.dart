import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/cart/domain/entities/get_items_in_cart_entity.dart';
import 'package:e_commerce/features/cart/domain/repo/base_cart_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetItemsInCartUseCase {
  BaseCartRepo baseCartRepo;
  GetItemsInCartUseCase({required this.baseCartRepo});

  Future<Either<Failure, GetItemsInCartEntity>> call() async {
    return baseCartRepo.getItemsInCart();
  }
}
