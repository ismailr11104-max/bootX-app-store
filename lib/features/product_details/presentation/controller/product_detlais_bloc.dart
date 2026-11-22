import 'package:bootx_app/features/product_details/domain/repo/get_product_details_usecase.dart';
import 'package:bootx_app/features/product_details/presentation/controller/product_detlais_event.dart';
import 'package:bootx_app/features/product_details/presentation/controller/product_detlais_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsBloc
    extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  final GetProductDetailsUseCase getProductDetailsUseCase;

  ProductDetailsBloc(this.getProductDetailsUseCase)
    : super(ProductDetailsInitial()) {
    on<GetProductDetailsEvent>(_onGetProductDetails);
    on<SelectImageEvent>(_onSelectImage);
    on<SelectSizeEvent>(_onSelectSize);
    on<AddToCartEvent>(_onAddToCart);
  }

  Future<void> _onGetProductDetails(
    GetProductDetailsEvent event,
    Emitter<ProductDetailsState> emit,
  ) async {
    emit(ProductDetailsLoading());

    final result = await getProductDetailsUseCase(event.productId);

    result.fold(
      (failure) => emit(ProductDetailsError(failure.message)),
      (product) => emit(ProductDetailsSuccess(product: product)),
    );
  }

  void _onSelectImage(
    SelectImageEvent event,
    Emitter<ProductDetailsState> emit,
  ) {
    final currentState = state;
    if (currentState is! ProductDetailsSuccess) return;
    if (event.index == currentState.selectedImageIndex) return;

    emit(currentState.copyWith(selectedImageIndex: event.index));
  }

  void _onSelectSize(SelectSizeEvent event, Emitter<ProductDetailsState> emit) {
    final currentState = state;
    if (currentState is! ProductDetailsSuccess) return;
    if (event.index == currentState.selectedSizeIndex) return;

    emit(currentState.copyWith(selectedSizeIndex: event.index));
  }

  void _onAddToCart(AddToCartEvent event, Emitter<ProductDetailsState> emit) {
    final currentState = state;
    if (currentState is! ProductDetailsSuccess) return;

    final sizes = currentState.product.sizes;
    final selectedSize =
        sizes.isNotEmpty && currentState.selectedSizeIndex < sizes.length
        ? sizes[currentState.selectedSizeIndex]
        : '';
    emit(currentState.copyWith(isAddedToCart: false));
    emit(currentState.copyWith(isAddedToCart: true));
  }
}
