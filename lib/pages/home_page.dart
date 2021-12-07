import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                icon: Icon(Icons.qr_code_scanner),
                onPressed: () {
                  Navigator.of(context).pushNamed('scanner');
                },
                label: Text('Scanner QR'),
                style: ElevatedButton.styleFrom(
                    primary: Colors.purple,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    textStyle: TextStyle(fontSize: 20, color: Colors.white)),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton.icon(
                icon: Icon(Icons.file_copy_outlined),
                onPressed: () {
                  Navigator.of(context).pushNamed('producto');
                },
                label: Text('CRUD'),
                style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    textStyle: TextStyle(fontSize: 20, color: Colors.white)),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton.icon(
                icon: Icon(Icons.location_on_sharp),
                onPressed: () {
                  Navigator.of(context).pushNamed('maps');
                },
                label: Text('Google Maps'),
                style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    textStyle: TextStyle(fontSize: 20, color: Colors.white)),
              ),
            ],
          ),
        ));
  }
}
