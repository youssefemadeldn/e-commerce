part of 'bottom_navigation_bar_cubit.dart';

sealed class BottomNavigationBarState extends Equatable {
  const BottomNavigationBarState();

  @override
  List<Object> get props => [];
}

// BottomNavigationBarStates
final class BottomNavigationBarInitialState extends BottomNavigationBarState {}

final class BottomNavigationBarChangeIndexState
    extends BottomNavigationBarState {}

// AddToCartStates
final class AddToCartLoadingState extends BottomNavigationBarState {}

final class AddToCartErrorState extends BottomNavigationBarState {
  final Failure failure;

  const AddToCartErrorState({required this.failure});
}

final class AddToCartSuccessState extends BottomNavigationBarState {
  final AddToCartEntity addToCartEntity;
  const AddToCartSuccessState({required this.addToCartEntity});
}
