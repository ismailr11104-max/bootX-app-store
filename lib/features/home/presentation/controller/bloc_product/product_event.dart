import 'package:equatable/equatable.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object?> get props => [];
}

class GetProductsEvent extends ProductEvent {
  final String? categoryId;
  const GetProductsEvent({this.categoryId});
  @override
  List<Object?> get props => [categoryId];
}
