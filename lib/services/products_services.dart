
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:productos_app/models/models.dart';

class ProductsServices extends ChangeNotifier{

  final String _baseUrl = 'flutter-varios-b135a-default-rtdb.firebaseio.com';
  final List<Product> products = [];
  bool isLoading = true;

  ProductsServices(){

    loadProducts();

  }

  //TODO hacer el fetch de productos

  Future<List<Product>> loadProducts() async {

    isLoading = true;
    notifyListeners();

    final url = Uri.https( _baseUrl, 'products.json');

    final res = await http.get( url );
    
    final Map<String, dynamic> productsMap = jsonDecode(res.body);


    productsMap.forEach((key, value) { 
      final tempProduct = Product.fromJson(value);
      tempProduct.id = key;
      products.add(tempProduct);
    });

    print(products[0].name);

  }


}