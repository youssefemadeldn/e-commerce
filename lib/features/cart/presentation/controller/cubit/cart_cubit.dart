import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/bottom_navigation_bar/data/models/add_to_cart_model.dart';
import 'package:e_commerce/features/cart/domain/entities/get_items_in_cart_entity.dart';
import 'package:e_commerce/features/cart/domain/use_case/get_items_in_cart_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'cart_state.dart';

@injectable
class CartCubit extends Cubit<CartState> {
  GetItemsInCartUseCase getItemsInCartUseCase;
  List<ProductsModel> productsList = [];
  CartCubit({required this.getItemsInCartUseCase}) : super(CartInitialState());

  void getItemsInCart() async {
    emit(GetCartLoadingState());
    var either = await getItemsInCartUseCase.call();

    either.fold((failure) => emit(GetCartErrorState(failure: failure)),
        (getItemsInCartModel) {
      productsList = getItemsInCartModel.data!.products as List<ProductsModel>;
      emit(GetCartSuccessState(getItemsInCartEntity: getItemsInCartModel));
    });
  }
}
