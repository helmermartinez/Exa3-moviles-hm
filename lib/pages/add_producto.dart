import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qr_scanner/config/database.dart';

class AddProduct extends StatefulWidget {
  AddProduct({Key? key, required this.db}) : super(key: key);
  Database db;

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  TextEditingController productoController = new TextEditingController();
  TextEditingController precioController = new TextEditingController();
  TextEditingController codigoController = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add new Docente"),
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
              widget.db.create(productoController.text, codigoController.text,
                  precioController.text);
              showToastadd();
              Navigator.pop(context, true);
            },
            child: Text("Save"),
          ),
        ),
      ),
    );
  }
}

void showToastadd() => Fluttertoast.showToast(
    msg: 'Added Successfuly',
    fontSize: 18,
    backgroundColor: Colors.green,
    textColor: Colors.white);
