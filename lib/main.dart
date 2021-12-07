import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:qr_scanner/pages/add_producto.dart';
import 'package:qr_scanner/pages/home_page.dart';
import 'package:qr_scanner/pages/maps_page.dart';
import 'package:qr_scanner/pages/producto_page.dart';
import 'package:qr_scanner/pages/scanner_page.dart';
import 'package:qr_scanner/pages/view_product.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        'scanner': (_) => ScannerPage(),
        'producto': (_) => ProductoPage(),
        'home': (_) => HomePage(),
        'maps': (_) => MapsGoogle(),
      },
      initialRoute: 'home',
    );
  }
}
