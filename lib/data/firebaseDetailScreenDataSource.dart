import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doc_ueberall/model/detailScreen.dart';
import 'package:rxdart/rxdart.dart';

class FirebaseDetailScreenDataSource {
  final Firestore fStore;

  final BehaviorSubject<DetailScreen> _detailScreenSubject = BehaviorSubject();
  Stream<DetailScreen> get outDetailScreen => _detailScreenSubject.stream;

  FirebaseDetailScreenDataSource(this.fStore) {
    fStore.collection("kapitel_detail").getDocuments().then((querySnapshot) {
      print(
          "querySnapshot.documents.first.data ${querySnapshot.documents.first.data}");
      _detailScreenSubject.sink
          .add(DetailScreen.fromJson(querySnapshot.documents.first.data));
    });
  }

  void dispose() {
    _detailScreenSubject.drain();
  }
}
