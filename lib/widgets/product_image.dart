import 'package:flutter/material.dart';


class ProductImage extends StatelessWidget {
  const ProductImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: const EdgeInsets.only(left: 10, right: 10, top: 10),

      child: Container(

        decoration: _buildBoxDecoration(),
        width: double.infinity,
        height: 400,
        child: const ClipRRect(
          borderRadius:  BorderRadius.only(topLeft: Radius.circular(45), topRight: Radius.circular(45)),
          child: FadeInImage(
            placeholder: AssetImage('assets/no-image.png'), 
            image: NetworkImage('https://via.placeholder.com/400x300/f6f6f6/969696'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
    color: Colors.red,
    borderRadius: const BorderRadius.only(topLeft: Radius.circular(45), topRight: Radius.circular(45)),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.05),
        blurRadius: 10,
        offset: const Offset(0, 5)
      )
    ]
  );
}