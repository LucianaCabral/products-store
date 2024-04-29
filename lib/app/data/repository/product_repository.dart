import 'dart:convert';

import 'package:products_store/app/data/repository/i_product_repository..dart';

import '../client/i_http_client.dart';
import '../exceptions/exceptions.dart';
import '../model/product.dart';

class ProductRepository extends IProductRepository {
  final IHttpClient client;

  ProductRepository({required this.client});

  @override
  Future<List<Product>> getProducts() async {
    final response = await client.get(
      url: 'https://dummyjson.com/products',
    );

    if (response.statusCode == 200) {
      final List<Product> produtos = [];

      final body = jsonDecode(response.body);

      body['products'].map((item) {
        final Product product = Product.fromJson(item);
        produtos.add(product);
      }).toList();

      return produtos;
    } else if (response.statusCode == 404) {
      throw NotFoundException('A url informada não é válida', '');
    } else {
      throw Exception('Não foi possível carregar os produtos');
    }
  }
}
