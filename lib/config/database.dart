import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Database {
  late FirebaseFirestore firestore;
  initialise() {
    firestore = FirebaseFirestore.instance;
  }

  Future<List> read() async {
    QuerySnapshot querySnapshot;
    List docs = [];
    try {
      querySnapshot =
          await firestore.collection('producto').orderBy('timestamp').get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          Map a = {
            "id": doc.id,
            "nombre": doc['nombre'],
            "codigo": doc['codigo'],
            "precio": doc['precio']
          };
          docs.add(a);
        }
      }
      return docs;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> update(
      String id, String, nombre, String codigo, String precio) async {
    try {
      await firestore
          .collection('producto')
          .doc(id)
          .update({'nombre': nombre, 'codigo': codigo, 'precio': precio});
    } catch (e) {
      print(e);
    }
  }

  Future<void> create(String nombre, String codigo, String precio) async {
    try {
      await firestore.collection('producto').add({
        'nombre': nombre,
        'codigo': codigo,
        'precio': precio,
        'timestamp': FieldValue.serverTimestamp()
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> delete(String id) async {
    try {
      await firestore.collection('producto').doc(id).delete();
    } catch (e) {
      print(e);
    }
  }
}
