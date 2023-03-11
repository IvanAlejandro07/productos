import 'package:flutter/material.dart';
import 'package:productos_app/providers/login_form_provider.dart';
import 'package:productos_app/screens/screens.dart';
import 'package:productos_app/ui/input_decoration.dart';
import 'package:productos_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AuthBackground(
            child: SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 250,
          ),
          CardContainer(
            child: Column(
              children: [
                const SizedBox(height: 10,),

                Text('Login',style: Theme.of(context).textTheme.headlineSmall,),

                const SizedBox(height: 30,),

                ChangeNotifierProvider(
                  create: (context) => LoginFormProvider(),
                  child: const _LoginForm(),
                ),

              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          const Text('Crear una cuenta:',style: TextStyle(fontSize: 28),)
        ],
      ),
    )
    )
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({super.key});

  @override
  Widget build(BuildContext context) {

    final loginForm = Provider.of<LoginFormProvider>(context);

    return Container(
      child: Form(

          //TODO mantener la referencia al key
          key: loginForm.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              TextFormField(
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecorationUi.authInputDecoration(
                    hintText: 'Example@gmail.com',
                    labelText: 'Correo',
                    prefixIcon: Icons.mail),
                     onChanged: (value) {
                      loginForm.email = value;
                    },
                validator: (value) {

                  String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                  RegExp regExp  = RegExp(pattern);

                  return regExp.hasMatch(value ?? '')
                    ? null
                    : 'El valor ingresado no luce como un correo';

                },
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                autocorrect: false,
                obscureText: true,
                decoration: InputDecorationUi.authInputDecoration(
                    hintText: '********',
                    labelText: 'Contraseña',
                    prefixIcon: Icons.password),
                    onChanged: (value) {
                      loginForm.password = value;
                    },
                    validator: (value) {
                 return (value != null && value.length >= 6)
                 ? null
                 : 'La contrasena debe de ser minimo 6 caracteres';
                },
              ),

              const SizedBox(height: 30,),
              MaterialButton(
                disabledColor: Colors.black,
                
                onPressed: loginForm.isLoading ? null : () async {
                  
                  FocusScope.of(context).unfocus();
                 
                 if(!loginForm.isValidForm()) return;
                  
                  loginForm.isLoading = true;

                  await Future.delayed(const Duration(seconds: 3));

                  loginForm.isLoading = false;

                  Navigator.pushReplacementNamed(context, 'home');
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 0,
                color: Colors.deepPurple,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  child: Text( !loginForm.isLoading ? 'Ingresar' : 'Cargando',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
