part of 'cart_cubit.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartInitialState extends CartState {}

final class GetCartLoadingState extends CartState {}

final class GetCartErrorState extends CartState {
  final Failure failure;
  const GetCartErrorState({required this.failure});
}

final class GetCartSuccessState extends CartState {
  final GetItemsInCartEntity getItemsInCartEntity;

  const GetCartSuccessState({required this.getItemsInCartEntity});
}
