import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doc_ueberall/model/kapitels.dart';
import 'package:rxdart/rxdart.dart';

class FirebaseKepitelsDataSource {
  final Firestore fStore;

  final BehaviorSubject<Kepitels> _kepitolsSubject = BehaviorSubject();
  Stream<Kepitels> get outZuletztGesehen => _kepitolsSubject.stream;

  FirebaseKepitelsDataSource(this.fStore) {
    fStore.collection("kapitel").getDocuments().then((querySnapshot) {
      print(
          "querySnapshot.documents.first.data ${querySnapshot.documents.first.data}");
      _kepitolsSubject.sink
          .add(Kepitels.fromJson(querySnapshot.documents.first.data));
    });
  }

  void dispose() {
    _kepitolsSubject.drain();
  }
}
