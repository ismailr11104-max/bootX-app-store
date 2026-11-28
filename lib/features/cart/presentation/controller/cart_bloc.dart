import 'package:bootx_app/features/cart/domain/usecase/add_cart_usecase.dart';
import 'package:bootx_app/features/cart/domain/usecase/clear_cart_usecase.dart';
import 'package:bootx_app/features/cart/domain/usecase/get_cart_usecase.dart';
import 'package:bootx_app/features/cart/domain/usecase/remove_cart_item_usecase.dart';
import 'package:bootx_app/features/cart/domain/usecase/update_cart_item_usecase.dart';
import 'package:bootx_app/features/cart/presentation/controller/cart_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final GetCartUseCase getCart;
  final AddToCartUseCase addToCart;
  final RemoveCartItemUseCase removeCartItem;
  final UpdateCartItemUseCase updateCartItem;
  final ClearCartUseCase clearCart;

  CartBloc({
    required this.getCart,
    required this.addToCart,
    required this.updateCartItem,
    required this.removeCartItem,
    required this.clearCart,
  }) : super(CartInitial()) {
    on<LoadCartEvent>(_onLoadCart);
    on<AddProductToCartEvent>(_onAddProduct);
    on<UpdateItemQuantityEvent>(_onUpdateQuantity);
    on<RemoveItemEvent>(_onRemoveItem);
    on<ClearCartEvent>(_onClearCart);
  }

  // Load Cart
  Future<void> _onLoadCart(LoadCartEvent event, Emitter<CartState> emit) async {
    emit(CartLoading());

    await _refreshCart(emit);
  }

  Future<void> _onAddProduct(
    AddProductToCartEvent event,
    Emitter<CartState> emit,
  ) async {
    final result = await addToCart(
      productId: event.productId,
      quantity: event.quantity,
      size: event.size,
      color: event.color,
    );

    await result.fold<Future<void>>(
      (failure) async {
        emit(CartError(failure.message));
      },
      (_) async {
        await _refreshCart(
          emit,
          message: 'The product has been added successfully to the cart.',
        );
      },
    );
  }

  Future<void> _onUpdateQuantity(
    UpdateItemQuantityEvent event,
    Emitter<CartState> emit,
  ) async {
    if (event.newQuantity <= 0) {
      add(RemoveItemEvent(event.productId));
      return;
    }

    final result = await updateCartItem(
      productId: event.productId,
      quantity: event.newQuantity,
      size: event.size,
      color: event.color,
    );

    await result.fold<Future<void>>(
      (failure) async {
        emit(CartError(failure.message));
      },
      (_) async {
        await _refreshCart(emit);
      },
    );
  }

  Future<void> _onRemoveItem(
    RemoveItemEvent event,
    Emitter<CartState> emit,
  ) async {
    final result = await removeCartItem(event.productId);

    await result.fold<Future<void>>(
      (failure) async {
        emit(CartError(failure.message));
      },
      (_) async {
        await _refreshCart(
          emit,
          message: 'The product has been removed successfully from the cart.',
        );
      },
    );
  }

  Future<void> _onClearCart(
    ClearCartEvent event,
    Emitter<CartState> emit,
  ) async {
    final result = await clearCart();

    await result.fold<Future<void>>(
      (failure) async {
        emit(CartError(failure.message));
      },
      (_) async {
        await _refreshCart(emit);
      },
    );
  }

  Future<void> _refreshCart(Emitter<CartState> emit, {String? message}) async {
    final result = await getCart();

    result.fold(
      (failure) => emit(CartError(failure.message)),
      (cart) => emit(CartLoaded(cart, message: message)),
    );
  }
}
