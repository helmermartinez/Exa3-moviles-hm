import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class Producto {
  String _id = "";
  String _nombre = "";
  String _codigo = "";
  String _descripcion = "";
  String _precio = "";
  String _stock = "";

  Producto(this._id, this._nombre, this._codigo, this._descripcion,
      this._precio, this._stock);

  Producto.map(dynamic obj) {
    this._nombre = obj['nombre'];
    this._codigo = obj['codigo'];
    this._descripcion = obj['descripcion'];
    this._precio = obj['precio'];
    this._stock = obj['stock'];
  }

  String get id => _id;
  String get nombre => _nombre;
  String get codigo => _codigo;
  String get descripcion => _descripcion;
  String get precio => _precio;
  String get stock => _stock;

  Producto.fromSnapShop(DataSnapshot snapshot) {
    _id = snapshot.key!;
    _nombre = snapshot.value['nombre'];
    _codigo = snapshot.value['codigo'];
    _descripcion = snapshot.value['descripcion'];
    _precio = snapshot.value['precio'];
    _stock = snapshot.value['stock'];
  }
}
