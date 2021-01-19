import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doc_ueberall/model/kapitels.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class FirebaseKepitelsDataSource {
  final Firestore fStore;

  final BehaviorSubject<Kepitels> _kepitolsSubject = BehaviorSubject();
  Stream<Kepitels> get outZuletztGesehen => _kepitolsSubject.stream;

  FirebaseKepitelsDataSource(this.fStore) {
    SharedPreferences.getInstance().then((prefs) {
      var kapitels = prefs.getString('kapitels');
      if (kapitels == null) {
        fStore.collection("kapitel").getDocuments().then((querySnapshot) {
          _kepitolsSubject.sink
              .add(Kepitels.fromJson(querySnapshot.documents.first.data));
          prefs.setString(
              'kapitels', json.encode(querySnapshot.documents.first.data));
        });
      } else {
        _kepitolsSubject.sink
            .add(Kepitels.fromJson(json.decode(prefs.getString('kapitels'))));
      }
    });
//    SharedPreferences prefs = await
//    int counter = (prefs.getInt('counter') ?? 0) + 1;
//    print('Pressed $counter times.');
//    await prefs.setInt('counter', counter);
//    fStore.collection("kapitel").getDocuments().then((querySnapshot) {
//      print(
//          "querySnapshot.documents.first.data ${querySnapshot.documents.first.data}");
//      _kepitolsSubject.sink
//          .add(Kepitels.fromJson(querySnapshot.documents.first.data));
//    });
  }

  void dispose() {
    _kepitolsSubject.drain();
  }
}
