import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class LoadProducts extends HomeEvent {
  const LoadProducts();

  @override
  List<Object?> get props => [];
}

class SearchProducts extends HomeEvent {
  final String query;

  const SearchProducts(this.query);

  @override
  List<Object?> get props => [query];
}

class SortProducts extends HomeEvent {
  final String sortType;

  const SortProducts(this.sortType);

  @override
  List<Object?> get props => [sortType];
}
