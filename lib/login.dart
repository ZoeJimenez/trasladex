// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'formulario_registro.dart';

class MyAppForm extends StatefulWidget {
  const MyAppForm({Key? key}) : super(key: key);

  @override
  _MyAppFormState createState() => _MyAppFormState();
}

class _MyAppFormState extends State<MyAppForm> {
  final formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late String _nombre;
  late String _email;
  late String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color.fromARGB(1, 28, 24, 24),
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 90.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/logo.png',
                width: 120.0,
              ),
              Text(
                'Login',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 30.0,
                    color: Colors.white),
              ),
              Divider(
                height: 18.0,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: '',
                  labelText: 'Usuario/Email',
                  labelStyle:
                      TextStyle(color: Colors.white, fontFamily: 'Montserrat'),
                  suffixIcon: Icon(
                    Icons.alternate_email,
                    color: Color.fromARGB(255, 69, 191, 233),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 69, 191, 233), width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(color: Colors.white, width: 2.0),
                  ),
                ),
                style: TextStyle(color: Colors.white, fontFamily: 'Montserrat'),
                validator: (valor) {
                  if (valor!.isEmpty) {
                    return 'Ingrese su usuario o email';
                  } else if (!RegExp(
                              r"^[a-zA-Z0-9]+([a-zA-Z0-9](_|-|)[a-zA-Z0-9])*[a-zA-Z0-9]+$")
                          .hasMatch(valor) &&
                      !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(valor)) {
                    return 'Ingrese un usuario o email valido';
                  } else {
                    return null;
                  }
                },
              ),
              Divider(
                height: 15.0,
              ),
              TextFormField(
                enableInteractiveSelection: false,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: '',
                  labelText: 'Contraseña',
                  labelStyle:
                      TextStyle(color: Colors.white, fontFamily: 'Montserrat'),
                  suffixIcon: Icon(
                    Icons.lock_outline,
                    color: Color.fromARGB(255, 69, 191, 233),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 69, 191, 233), width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(color: Colors.white, width: 2.0),
                  ),
                ),
                style: TextStyle(color: Colors.white, fontFamily: 'Montserrat'),
                validator: (valor) {
                  if (valor!.isEmpty) {
                    return 'Ingrese una contraseña';
                  } else if (!RegExp(
                          r'^(?=\w*\d)(?=\w*[A-Z])(?=\w*[a-z])\S{8,16}$')
                      .hasMatch(valor)) {
                    return "La contraseña debe tener minimo de 8 caracteres,\n\n"
                        "un dígito, una minúscula y una mayúscula.";
                  } else {
                    return null;
                  }
                },
              ),
              Divider(
                height: 18.0,
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: StadiumBorder(),
                  side: BorderSide(
                      width: 2, color: Color.fromARGB(255, 69, 191, 233)),
                  //backgroundColor: Color.fromARGB(255, 69, 191, 233),
                ),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    final snackBar =
                        SnackBar(content: Text('Iniciando sesion'));
                    // ignore: deprecated_member_use
                    _scaffoldKey.currentState!.showSnackBar(snackBar);
                  }
                },
                child: Text(
                  'Iniciar Sesion',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontFamily: 'Montserrat'),
                ),
              ),
              Divider(
                height: 20.0,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Color.fromARGB(255, 69, 191, 233),
                ),
                onPressed: () {},
                child: Text('¿Olvidaste la contraseña?'),
              ),
              Divider(
                height: 10.0,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Color.fromARGB(255, 69, 191, 233),
                ),
                onPressed: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegistrationPage()),
                  );
                },
                child: Text('Crear cuenta'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
