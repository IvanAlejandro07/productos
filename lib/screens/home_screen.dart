
import 'package:flutter/material.dart';
import 'package:productos_app/services/products_services.dart';
import 'package:productos_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);


  
  @override
  Widget build(BuildContext context) {
    
    final productsServices = Provider.of<ProductsServices>(context);
    
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Productos'),
      ),

      body: ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => GestureDetector(
          onTap: () => Navigator.pushNamed(context, 'producto'),
          child: ProductCard(), 
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},

      ),

    );
  }
}