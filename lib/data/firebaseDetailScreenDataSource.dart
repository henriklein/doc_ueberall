import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doc_ueberall/model/kapitelDetails.dart';
import 'package:rxdart/rxdart.dart';

class FirebaseDetailScreenDataSource {
  final Firestore _fStore;

  final BehaviorSubject<List<Details>> _detailScreenSubject = BehaviorSubject();
  Stream<List<Details>> get outDetailScreen => _detailScreenSubject.stream;

  FirebaseDetailScreenDataSource(this._fStore) {
    _fStore.collection("kapitel_detail").getDocuments().then((querySnapshot) {
      print(
          "querySnapshot.documents.first.data ${querySnapshot.documents.first.data}");
      var details = querySnapshot.documents
          .map((detailDoc) => Details.fromJson(detailDoc.data))
          .toList()
          .cast<Details>();
      _detailScreenSubject.sink.add(details);
    });
  }

  getDetails(String kapitelId) async {
    var doc = await _fStore
        .collection("kapitel_detail")
        .where('kapitel_id', isEqualTo: kapitelId)
        .getDocuments();
    return Details.fromJson(doc.documents.first.data);
//    return _detailScreenSubject.value
//        ?.where((element) => element.kapitelId == kapitelId);
  }

  void dispose() {
    _detailScreenSubject.drain();
  }
}
