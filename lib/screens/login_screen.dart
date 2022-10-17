import 'package:flutter/material.dart';
import 'package:productos_app/providers/login_form_provider.dart';

import 'package:productos_app/ui/input_decorations.dart';
import 'package:productos_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Authbackground(
            child: SingleChildScrollView(
                child: Column(
      children: [
        const SizedBox(
          height: 250,
        ),
        CardContainer(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                "Login",
                style: Theme.of(context).textTheme.headline4,
              ),
              const SizedBox(
                height: 30,
              ),
              ChangeNotifierProvider(
                create: (_) => LoginFormProvider(),
                child: _LoginForm(),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        const Text(
          "Crear una nueva cuenta",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 50,
        ),
      ],
    ))));
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);

    return Container(
        child: Form(
      //TODO: mantener la referencia al key
      //se requiere el key para poder disparar las validaciones de los campos cuando se oprima el boton, pero esten vacios los campos
      key: loginForm.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,

      child: Column(
        children: [
          TextFormField(
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecorations.authInputDecoration(
                hintText: 'user@email.com',
                labelText: 'login',
                prefixIcon: Icons.alternate_email_sharp),
            onChanged: (value) => loginForm.email = value,
            validator: (value) {
              String pattern =
                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
              RegExp regExp = RegExp(pattern);
              return regExp.hasMatch(value ?? '') ? null : 'Correo incorrecto';
            },
          ),
          const SizedBox(
            height: 30,
          ),
          TextFormField(
            autocorrect: false,
            obscureText: true,
            keyboardType: TextInputType.text,
            decoration: InputDecorations.authInputDecoration(
                hintText: '*****',
                labelText: 'Password',
                prefixIcon: Icons.lock_outline),
            onChanged: (value) => loginForm.password = value,
            validator: (value) {
              if (value != null && value.length >= 6) return null;
              return 'La contraseña debe de ser 6 caracteres por lo menos';
            },
          ),
          const SizedBox(
            height: 30,
          ),
          MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            disabledColor: Colors.grey,
            elevation: 0,
            color: Colors.deepPurple,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
              child: Text(
                (loginForm.isLoading == true) ? 'Espere ...' : 'ingresar',
                style: TextStyle(color: Colors.white),
              ),
            ),
            //desactiva el boton mientras esta cargando
            onPressed: (loginForm.isLoading == true)
                ? null
                : () async {
                    //quita el teclado
                    FocusScope.of(context).unfocus();
                    //Todo login form
                    if (!loginForm.isValidForm()) return;

                    loginForm.isLoading = true;
                    await Future.delayed(const Duration(seconds: 2));
                    //validar si el login es correcto
                    loginForm.isLoading = false;
                    //destruye las pantallas anteriores y la reemplaza por la nueva
                    Navigator.pushReplacementNamed(context, 'home');
                  },
          )
        ],
      ),
    ));
  }
}
