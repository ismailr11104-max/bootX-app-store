import 'package:bootx_app/core/entity/product_entity.dart';
import 'package:equatable/equatable.dart';

sealed class SearchState extends Equatable {
  final List<String> history;

  const SearchState({this.history = const []});

  @override
  List<Object?> get props => [history];
}

class SearchInitial extends SearchState {
  const SearchInitial({super.history});
}

class SearchLoading extends SearchState {
  const SearchLoading({super.history});
}

class SearchSuccess extends SearchState {
  final List<ProductEntity> products;
  final String query;

  const SearchSuccess({
    required this.products,
    required this.query,
    required super.history,
  });

  @override
  List<Object> get props => [products, query];
}

class SearchEmpty extends SearchState {
  final String query;

  const SearchEmpty({required this.query, required super.history});

  @override
  List<Object> get props => [query];
}

class SearchError extends SearchState {
  final String message;

  const SearchError({required this.message, required super.history});

  @override
  List<Object?> get props => [message];
}
