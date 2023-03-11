import 'package:flutter/material.dart';


class AuthBackground extends StatelessWidget {
  const AuthBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      
      child: Stack(
        children:  [

            _ContenedorFondo(),

            _HeaderIcon(),

            child,
        ],
      ),
    );
  }
}

class _HeaderIcon extends StatelessWidget {
  const _HeaderIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: 150,
        child: const Icon(Icons.person_pin, color: Colors.white, size: 100,),
      ),
    );
  }
}


class _ContenedorFondo extends StatelessWidget {
   
  const _ContenedorFondo({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      decoration: _purpleBackground(),
      child: Stack(
        children: const [
          Positioned(top: -20, left: 40,   child: _Bubble()),
          Positioned(top: 15, left: 150, child: _Bubble()),
          Positioned(top: 90, left: 300, child: _Bubble()),
          Positioned(top: 150, left: 140,  child: _Bubble()),
          Positioned(top: 200, left: 20,  child: _Bubble())
        ],
      ),
    );
  }

  BoxDecoration _purpleBackground() => const BoxDecoration(
    gradient: LinearGradient(
      colors: [
          Color.fromRGBO(63, 63, 156, 1),
          Color.fromRGBO(90, 70, 178, 1),
        ]
      )
  );
}



class _Bubble extends StatelessWidget {
  const _Bubble({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: const Color.fromRGBO(255, 255, 255, 0.2)
      ),
    );
  }
}