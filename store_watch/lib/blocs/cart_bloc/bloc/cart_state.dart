part of 'cart_bloc.dart';

abstract class CartState {}

final class CartInitial extends CartState {}

final class IncreaseDecreaseStet extends CartState {
  final int count;
  final double globalPrice;

  IncreaseDecreaseStet(this.count, this.globalPrice);
}

final class PriceState extends CartState {
  final double price;

  PriceState(this.price);
}
