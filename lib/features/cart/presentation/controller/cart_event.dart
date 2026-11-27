import 'package:bootx_app/core/entity/product_entity.dart';
import 'package:equatable/equatable.dart';

abstract class CartEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadCartEvent extends CartEvent {}

class AddProductToCartEvent extends CartEvent {
  final String productId;
  final int quantity;
  final String size;
  final String color;
  final ProductEntity product;

  AddProductToCartEvent({
    required this.productId,
    required this.product,
    this.quantity = 1,
    this.size = '',
    this.color = '',
  });

  @override
  List<Object?> get props => [productId, product, quantity, size, color];
}

class UpdateItemQuantityEvent extends CartEvent {
  final String productId;
  final int newQuantity;
  final String size;
  final String color;

  UpdateItemQuantityEvent({
    required this.productId,
    required this.newQuantity,
    required this.size,
    required this.color,
  });

  @override
  List<Object?> get props => [productId, newQuantity, size, color];
}

class RemoveItemEvent extends CartEvent {
  final String productId;

  RemoveItemEvent(this.productId);

  @override
  List<Object?> get props => [productId];
}

class ClearCartEvent extends CartEvent {}
