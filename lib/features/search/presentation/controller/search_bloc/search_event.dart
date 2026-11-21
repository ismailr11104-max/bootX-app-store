import 'package:equatable/equatable.dart';

sealed class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object?> get props => [];
}

class LoadSearchHistoryEvent extends SearchEvent {
  const LoadSearchHistoryEvent();
}

class SearchProductsEvent extends SearchEvent {
  final String query;

  const SearchProductsEvent(this.query);

  @override
  List<Object?> get props => [query];
}

class DeleteSearchHistoryEvent extends SearchEvent {
  final String query;

  const DeleteSearchHistoryEvent(this.query);

  @override
  List<Object?> get props => [query];
}
