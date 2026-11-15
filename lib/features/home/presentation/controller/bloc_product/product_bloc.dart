import 'dart:async';

import 'package:bootx_app/features/home/domain/usecase/get_product_usecase.dart';
import 'package:bootx_app/features/home/presentation/controller/bloc_product/product_event.dart';
import 'package:bootx_app/features/home/presentation/controller/bloc_product/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProductUseCase getProductUseCase;

  ProductBloc({required this.getProductUseCase})
    : super(const ProductInitial()) {
    on<GetProductsEvent>(_onLoadProduct);
  }

  Future<void> _onLoadProduct(
    GetProductsEvent event,
    Emitter<ProductState> emit,
  ) async {
    emit(const ProductLoading());

    final result = await getProductUseCase.call(event.categoryId);

    result.fold(
      (failure) => emit(ProductError(message: failure.message)),
      (products) => emit(ProductLoaded(products: products)),
    );
  }
}
