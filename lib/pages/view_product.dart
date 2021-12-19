import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qr_scanner/config/database.dart';

class ViewProduct extends StatefulWidget {
  ViewProduct({Key? key, required this.producto, required this.db})
      : super(key: key);
  Map producto;
  Database db;

  @override
  _ViewProductState createState() => _ViewProductState();
}

class _ViewProductState extends State<ViewProduct> {
  TextEditingController productoController = new TextEditingController();
  TextEditingController precioController = new TextEditingController();
  TextEditingController codigoController = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Estos son: ${widget.producto}");
    productoController.text = widget.producto['nombre'];
    precioController.text = widget.producto['precio'];
    codigoController.text = widget.producto['codigo'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Docente View"),
        actions: [
          IconButton(
              onPressed: () {
                widget.db.delete(widget.producto['id']);
                showToastdelete();
                Navigator.pop(context, true);
              },
              icon: Icon(Icons.delete))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextFormField(
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(counterText: "Nombre Docente"),
                controller: productoController,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(counterText: "Codigo Docente"),
                controller: precioController,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(counterText: "Materia Docente"),
                controller: codigoController,
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        color: Colors.transparent,
        child: BottomAppBar(
          color: Colors.transparent,
          child: ElevatedButton(
            onPressed: () {
              widget.db.update(
                  widget.producto['id'],
                  String,
                  productoController.text,
                  codigoController.text,
                  precioController.text);
              showToastupdate();
              Navigator.pop(context, true);
            },
            child: Text("Update"),
          ),
        ),
      ),
    );
  }
}

void showToastupdate() => Fluttertoast.showToast(
    msg: 'Updated Successfuly',
    fontSize: 18,
    backgroundColor: Colors.indigo,
    textColor: Colors.white);

void showToastdelete() => Fluttertoast.showToast(
    msg: 'Deleted Successfuly',
    fontSize: 18,
    backgroundColor: Colors.red[400],
    textColor: Colors.white);
