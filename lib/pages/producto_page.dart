import 'package:flutter/material.dart';
import 'package:qr_scanner/config/database.dart';
import 'package:qr_scanner/pages/add_producto.dart';
import 'package:qr_scanner/pages/view_product.dart';

class ProductoPage extends StatefulWidget {
  ProductoPage({Key? key}) : super(key: key);

  @override
  _ProductoPageState createState() => _ProductoPageState();
}

class _ProductoPageState extends State<ProductoPage> {
  List docs = [];
  Database db = Database();
  initialise() {
    db.initialise();
    db.read().then((value) => {
          setState(() {
            docs = value;
          })
        });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialise();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Docentes'),
      ),
      body: ListView.builder(
          itemCount: docs.length,
          itemBuilder: (BuildContext contest, int index) {
            return Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                contentPadding: EdgeInsets.only(right: 20, left: 36),
                leading: Icon(
                  Icons.shopping_cart_outlined,
                ),
                title: Text(
                  docs[index]['nombre'],
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(docs[index]['codigo']),
                trailing: Text(docs[index]['precio']),
                onTap: () {
                  Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ViewProduct(producto: docs[index], db: db)))
                      .then((value) => {
                            if (value != null) {initialise()}
                          });
                },
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddProduct(db: db)))
              .then((value) => {
                    if (value != null) {initialise()}
                  });
        },
      ),
    );
  }
}
