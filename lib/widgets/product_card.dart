import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),

      child: Container(
        margin: const EdgeInsets.only(top: 30, bottom: 50),
        width: double.infinity,
        height: 400,
        decoration: _cardBorder(),
        child: Stack(
        alignment: Alignment.bottomLeft,
          children: [

            _BackgrounImage(),

            _ProductDetails(),

            Positioned(
              top: 0,
              right: 0,
              child: _PriceTag()
            ),

             Positioned(
              top: 0,
              left: 0,
              child: _NotAvailable()
            )

          ],
        ),
      ),
    );
  }

  BoxDecoration _cardBorder() {
    return BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(25),
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            offset: Offset(0, 6),
            blurRadius: 10
          )
        ]
      );
  }
}

class _NotAvailable extends StatelessWidget {
  const _NotAvailable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 100,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.only( bottomRight: Radius.circular(25), topLeft: Radius.circular(25) )
      ),
        child: const FittedBox(
        fit: BoxFit.contain,
        child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Text("No disponible")
        ),
      ),
    );
  }
}

class _PriceTag extends StatelessWidget {
  const _PriceTag({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FittedBox(
        fit: BoxFit.contain,
        child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Text("D 183.90")
        ),
      ),
      height: 70,
      width: 100,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.indigo,
        borderRadius: BorderRadius.only( topRight: Radius.circular(25), bottomLeft: Radius.circular(25) )
      ),
    );
  }
}



class _ProductDetails extends StatelessWidget {
  const _ProductDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 50),
      child: Container(
      padding: EdgeInsets.symmetric( horizontal: 20, vertical: 10),
        width: double.infinity,
        height: 70,
        decoration: _buildBoxDecoration(),
        child: Column(
          children: const [
            
            Text('Disco duro g', style: TextStyle( fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,),
            Text('id del disco',
            style: TextStyle(fontSize: 15, color: Colors.white),)
          ],
        ),
        
       
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
    color: Colors.indigo,
    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), topRight: Radius.circular(25))
  );
}


class _BackgrounImage extends StatelessWidget {
  const _BackgrounImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
    borderRadius: BorderRadius.circular(25),
      child: const SizedBox(
        width: double.infinity,
        height: 400,
        child: FadeInImage(
          placeholder: AssetImage('assets/jar-loading.gif'), 
          image: NetworkImage('https://via.placeholder.com/400x300/f6f6f6/969696'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}