import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CardContainer extends StatelessWidget {
  const CardContainer({super.key, required this.child});


  final Widget child;

  @override
  Widget build(BuildContext context) {
    return  Padding(
    padding: EdgeInsets.symmetric(horizontal: 30),
      child: Container(
    
        width: double.infinity,
        padding: const EdgeInsets.all( 20 ), // TODO borrar
        decoration: _createCardShape(),
        child: child,
    
      ),
    );
  }

  BoxDecoration _createCardShape() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(25),
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 15,
          offset: Offset(0, 5)
        )
      ]
    );
  }
}