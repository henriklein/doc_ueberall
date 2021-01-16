//import 'dart:async';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:doc_ueberall/model/kapitelInhalte.dart';
//import 'package:rxdart/rxdart.dart';
//
//class FirebaseKapitelInhalteDataSource {
//  final Firestore fStore;
//
//  final BehaviorSubject<KapitelInhaltes> _kapitelInhaltesSubject =
//      BehaviorSubject();
//  Stream<KapitelInhaltes> get outKapitelInhaltes =>
//      _kapitelInhaltesSubject.stream;
//
//  FirebaseKapitelInhalteDataSource(this.fStore) {
//    fStore.collection("kapitelInhalte").getDocuments().then((querySnapshot) {
//      _kapitelInhaltesSubject.sink
//          .add(KapitelInhaltes.fromJson(querySnapshot.documents.first.data));
//    });
//  }
//
//  void dispose() {
//    _kapitelInhaltesSubject.drain();
//  }
//}
