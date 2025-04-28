import 'package:equatable/equatable.dart';
import 'package:flutter_projects/features/home/models/product_model.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class ProductLoading extends HomeState {
  @override
  List<Object?> get props => [];
}

class ProductLoaded extends HomeState {
  final List<Products> products;

  const ProductLoaded(this.products);

  @override
  List<Object?> get props => [products];
}

class ProductError extends HomeState {
  final String message;

  const ProductError(this.message);

  @override
  List<Object?> get props => [message];
}
