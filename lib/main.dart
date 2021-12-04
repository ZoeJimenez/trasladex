// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

//se añaden las pantallas de obtencion direccion y pantalla mapa
import 'pantalla_mapa.dart';
import 'formulario_registro.dart';
import 'login.dart';

void main() => runApp(aplicacion_inicial());

class aplicacion_inicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Geolocalización',
        theme: ThemeData(
          primaryColor: Colors.black,
        ),
        home: MyAppForm());
  }
}

class preguntar_destino extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('SELECCION DE DESTINOS',
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(color: Colors.grey[50], letterSpacing: .5),
              ))),
      backgroundColor: Colors.black87,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Desde : ',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 20.0,
                  color: Colors.white),
            ),
            const Text(
              'Hasta: ',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 20.0,
                  color: Colors.white),
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: const StadiumBorder(),
                side: const BorderSide(
                    width: 2, color: Color.fromARGB(255, 69, 191, 233)),
                //backgroundColor: Color.fromARGB(255, 69, 191, 233),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => pantalla_mapa()),
                );
              },
              child: const Text(
                'Buscar Ruta',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontFamily: 'Montserrat'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
