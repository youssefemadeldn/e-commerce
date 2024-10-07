import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/cart/data/data_source/remote/base_remote_cart_data_source.dart';
import 'package:e_commerce/features/cart/domain/entities/get_items_in_cart_entity.dart';
import 'package:e_commerce/features/cart/domain/repo/base_cart_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BaseCartRepo)
class CartRepoImpl implements BaseCartRepo {
  BaseRemoteCartDataSource baseRemoteCartDataSource;

  CartRepoImpl({required this.baseRemoteCartDataSource});
  @override
  Future<Either<Failure, GetItemsInCartEntity>> getItemsInCart() async {
    var either = await baseRemoteCartDataSource.getItemsInCart();

    return either.fold(
      (failure) => left(failure),
      (getItemsInCartModel) => right(getItemsInCartModel),
    );
  }
}
