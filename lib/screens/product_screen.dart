import 'package:flutter/material.dart';
import 'package:productos_app/ui/input_decoration.dart';
import 'package:productos_app/widgets/widgets.dart';

class ProductScreen extends StatelessWidget {
   
  const ProductScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
              Stack(
                children:  [
                  const ProductImage(),
                  
                  Positioned(
                  top: 60,
                  left: 20,
                  child: IconButton(
                    onPressed: () => Navigator.of(context).pop(), 
                    icon: const Icon(Icons.arrow_back_ios_new)
                    ),
                  ),

                  Positioned(
                  top: 60,
                  left: 20,
                  child: IconButton(
                    onPressed: () => Navigator.of(context).pop(), 
                    icon: const Icon(Icons.arrow_back_ios_new)
                    ),
                  ),
                ],
              ),

            const _ProductForm(),

            const SizedBox(height: 100,)
              
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {} ,
        child: const Icon(Icons.save_outlined),
      ),

    );
  }
}

class _ProductForm extends StatelessWidget {
  const _ProductForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: double.infinity,
        decoration: _buildBoxDecoration(),
        child: Form(
          child: Column(
            children: [
              const SizedBox(height: 10,),

              TextFormField(
                decoration: InputDecorationUi.authInputDecoration(
                  hintText: 'Nombre del producto', 
                  labelText: 'Nombres',
                  prefixIcon: Icons.production_quantity_limits 
                ),
              ),

              const SizedBox(height: 30,),


              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecorationUi.authInputDecoration(
                  hintText: '\$150', 
                  labelText: 'Precio',
                  prefixIcon: Icons.attach_money 
                ),
              ),

              const SizedBox( height: 30,),

              SwitchListTile.adaptive(
                title: const Text('Disponible'),
                value: true, 
                activeColor: Colors.indigo,
                onChanged: (value) {
                  //TODO pendiente
                },
              )

            ],
          )
        ),
        
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
    color: Colors.white,
    borderRadius: const BorderRadius.only(bottomRight: Radius.circular(25), bottomLeft: Radius.circular(25)),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.05),
        offset: const Offset(0, 5),
        blurRadius: 5
      )
    ]
  );
}