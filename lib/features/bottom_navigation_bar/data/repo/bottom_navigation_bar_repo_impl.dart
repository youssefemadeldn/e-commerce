import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/bottom_navigation_bar/data/data_sources/remote/base_remote_bottom_navigation_bar_data_source.dart';
import 'package:e_commerce/features/bottom_navigation_bar/domain/entities/add_to_cart_entity.dart';
import 'package:e_commerce/features/bottom_navigation_bar/domain/repo/base_bottom_navigation_bar_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BaseBottomNavigationBarRepo)
class BottomNavigationBarRepoImpl implements BaseBottomNavigationBarRepo {
  BaseRemoteBottomNavigationBarDataSource
      baseRemoteBottomNavigationBarDataSource;
  BottomNavigationBarRepoImpl(
      {required this.baseRemoteBottomNavigationBarDataSource});
  @override
  Future<Either<Failure, AddToCartEntity>> addToCart(String productId) async {
    var either =
        await baseRemoteBottomNavigationBarDataSource.addToCart(productId);

    return either.fold(
      (failure) => Left(failure),
      (addToCartModel) => Right(addToCartModel),
    );
  }
}
