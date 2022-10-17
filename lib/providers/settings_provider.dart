import 'package:flutter/material.dart';

class SettingProvider extends ChangeNotifier {
  List<String> _endulzantes = <String>['azucar', 'Stevia', 'Deabetes'];
  List<String> _cafes = <String>[
    'Expres',
    'Cappuccino',
    'Frape',
    'Latte',
    'Caffe con leche',
    'Irlandes'
  ];

  Map<String, String> _imagenesCafe = {
    'Expres': 'express_coffee.jpg',
    'Cappuccino': 'cappuccino_cofffee.jpg',
    'Frape': 'frappe.jpg',
    'Irlandes': 'irish_coffee.jpg'
  };

  String imagenenCafe() {
    if (_imagenesCafe.containsKey(this._cafeSeleccionado)) {
      return _imagenesCafe[this._cafeSeleccionado]!;
    }

    return 'cafe.png';
  }

  String _cafeSeleccionado = 'Expres';
  double _cantidadEndulzante = 0;
  String _endulzanteSeleccionado = 'azucar';
  String _nombre = '';

  String get cafeSeleccionado {
    return this._cafeSeleccionado;
  }

  set cafeSeleccionado(String value) {
    print("cafe seleccionado:" + this._cafeSeleccionado);

    this._cafeSeleccionado = value;
    notifyListeners();
  }

  List<String> get cafes {
    return this._cafes;
  }

  List<String> get endulzantes {
    return this._endulzantes;
  }

  double get cantidadEndulzante {
    return this._cantidadEndulzante;
  }

  set cantidadEndulzante(double value) {
    _cantidadEndulzante = value;
    print("cantidad: " + this._cantidadEndulzante.toString());
    notifyListeners();
  }

  set endulzanteSeleccionado(String value) {
    _endulzanteSeleccionado = value;
    print("endulzante: " + this._endulzanteSeleccionado.toString());
    notifyListeners();
  }

  String get endulzanteSeleccionado {
    return this._endulzanteSeleccionado;
  }

  String get nombre {
    return this._nombre;
  }

  set nombre(String value) {
    print("Nombre: " + this._nombre);
    this._nombre = value;

    notifyListeners();
  }
}
