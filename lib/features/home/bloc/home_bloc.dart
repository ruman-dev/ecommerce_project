import 'dart:async';
import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/features/home/bloc/home_event.dart';
import 'package:flutter_projects/features/home/bloc/home_state.dart';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  List<Products> _originalProducts = [];

  HomeBloc() : super(ProductLoading()) {
    on<LoadProducts>(_onLoadProducts);
    on<SearchProducts>(_onSearchProducts);
  }

  Future<void> _onLoadProducts(
    LoadProducts event,
    Emitter<HomeState> emit,
  ) async {
    emit(ProductLoading());
    try {
      final response = await http.get(
        Uri.parse('https://dummyjson.com/products'),
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _originalProducts =
            (data['products'] as List)
                .map((item) => Products.fromJson(item))
                .toList();
        emit(ProductLoaded(_originalProducts));
      } else {
        emit(const ProductError('Failed to load products'));
      }
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }

  void _onSearchProducts(SearchProducts event, Emitter<HomeState> emit) {
    final filtered =
        _originalProducts.where((product) {
          return product.title!.toLowerCase().contains(
            event.query.toLowerCase(),
          );
        }).toList();
    emit(ProductLoaded(filtered));
  }
}
