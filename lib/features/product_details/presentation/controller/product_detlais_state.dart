import 'package:bootx_app/core/entity/product_entity.dart';
import 'package:equatable/equatable.dart';

abstract class ProductDetailsState extends Equatable {
  const ProductDetailsState();

  @override
  List<Object?> get props => [];
}

class ProductDetailsInitial extends ProductDetailsState {}

class ProductDetailsLoading extends ProductDetailsState {}

class ProductDetailsSuccess extends ProductDetailsState {
  final ProductEntity product;
  final int selectedImageIndex;
  final int selectedSizeIndex;
  final bool isAddedToCart;

  const ProductDetailsSuccess({
    required this.product,
    this.selectedImageIndex = 0,
    this.selectedSizeIndex = 0,
    this.isAddedToCart = false,
  });

  ProductDetailsSuccess copyWith({
    ProductEntity? product,
    int? selectedImageIndex,
    int? selectedSizeIndex,
    bool? isAddedToCart,
  }) {
    return ProductDetailsSuccess(
      product: product ?? this.product,
      selectedImageIndex: selectedImageIndex ?? this.selectedImageIndex,
      selectedSizeIndex: selectedSizeIndex ?? this.selectedSizeIndex,
      isAddedToCart: isAddedToCart ?? this.isAddedToCart,
    );
  }

  @override
  List<Object?> get props => [
    product,
    selectedImageIndex,
    selectedSizeIndex,
    isAddedToCart,
  ];
}

class ProductDetailsError extends ProductDetailsState {
  final String message;

  const ProductDetailsError(this.message);

  @override
  List<Object?> get props => [message];
}
