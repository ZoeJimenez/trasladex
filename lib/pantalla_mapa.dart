// ignore_for_file: use_key_in_widget_constructors, prefer_collection_literals

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:google_fonts/google_fonts.dart';


// ignore: camel_case_types
class pantalla_mapa extends StatefulWidget {
  final LatLng fromPoint = const LatLng(19.6620115, -101.1974723);
  final LatLng toPoint = const LatLng(19.722130, -101.185992);

  @override
  _EstadoMapa createState() => _EstadoMapa();
}

class _EstadoMapa extends State<pantalla_mapa> {
  late GoogleMapController _mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SELECCION DE DESTINOS', style : GoogleFonts.montserrat(
          textStyle: TextStyle(color: Colors.grey[50], letterSpacing: .5),
        )),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: widget.fromPoint,
          zoom: 8,
        ),
        markers: _createMarkers(),
        onMapCreated: _onMapCreated,
      ),
    );
  }

  Set<Marker> _createMarkers() {
    var tmp = Set<Marker>();

    tmp.add(Marker(
      markerId: const MarkerId("FormPoint"),
      position: widget.fromPoint,
      infoWindow: const InfoWindow(title: "Origen"),
    ));
    tmp.add(Marker(
      markerId: const MarkerId("toPoint"),
      position: widget.toPoint,
      infoWindow: const InfoWindow(title: "Destino"),
    ));

    return tmp;
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    _centerView();
  }

  _centerView() async {
    
    await _mapController.getVisibleRegion();

    var izquierda = min(widget.fromPoint.latitude, widget.toPoint.latitude);
    var derecha = max(widget.fromPoint.latitude, widget.toPoint.latitude);
    var arriba = max(widget.fromPoint.longitude, widget.toPoint.longitude);
    var abajo = min(widget.fromPoint.longitude, widget.toPoint.longitude);
    // ignore: non_constant_identifier_names
    var Bounds = LatLngBounds(
        southwest: LatLng(izquierda, abajo), northeast: LatLng(derecha, arriba));
    var cameraUpdate = CameraUpdate.newLatLngBounds(Bounds, 50);
    _mapController.animateCamera(cameraUpdate);
  }
}
