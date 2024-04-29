import 'package:flutter/cupertino.dart';

import '../../../data/exceptions/exceptions.dart';
import '../../../data/model/product.dart';
import '../../../data/repository/i_product_repository..dart';

class ProductStore {
  final IProductRepository repository;

  // Variável reativa para o loading
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  // Variável reativa para o state
  final ValueNotifier<List<Product>> state = ValueNotifier<List<Product>>([]);

  // Variável reativa para o erro
  final ValueNotifier<String> erro = ValueNotifier<String>('');

  ProductStore({required this.repository});

  Future getProducts() async {
    isLoading.value = true;
    try {
      final result = await repository.getProducts();
      state.value = result;
    } on NotFoundException catch (e) {
      erro.value = e.message;
    } catch (e) {
      erro.value = e.toString();
    }
    isLoading.value = false;
  }
}
