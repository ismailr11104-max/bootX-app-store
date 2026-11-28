import 'package:equatable/equatable.dart';

import '../../domain/entities/cart_entity.dart';

abstract class CartState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final CartEntity cart;
  final String? message;

  CartLoaded(this.cart, {this.message});

  @override
  List<Object?> get props => [cart, message];
}

class CartActionSuccess extends CartState {
  final String message;

  CartActionSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class CartError extends CartState {
  final String message;

  CartError(this.message);

  @override
  List<Object?> get props => [message];
}
