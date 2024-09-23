part of 'bottom_navigation_bar_cubit.dart';

sealed class BottomNavigationBarState extends Equatable {
  const BottomNavigationBarState();

  @override
  List<Object> get props => [];
}

final class BottomNavigationBarInitialState extends BottomNavigationBarState {}

final class BottomNavigationBarChangeIndexState
    extends BottomNavigationBarState {}
