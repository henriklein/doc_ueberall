import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doc_ueberall/model/kapitelDetails.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirebaseDetailScreenDataSource {
  final Firestore _fStore;

  final BehaviorSubject<List<Details>> _detailScreenSubject = BehaviorSubject();
  Stream<List<Details>> get outDetailScreen => _detailScreenSubject.stream;

  FirebaseDetailScreenDataSource(this._fStore) {
//    SharedPreferences.getInstance().then((prefs) {
//      var kapitels =
//          Kepitels.fromJson(json.decode(prefs.getString('kapitels')));
//      if (kapitels.kepitols == null) {
//        fStore.collection("kapitel").getDocuments().then((querySnapshot) {
//          _kepitolsSubject.sink
//              .add(Kepitels.fromJson(querySnapshot.documents.first.data));
//          prefs.setString(
//              'kapitels', querySnapshot.documents.first.data.toString());
//        });
//      } else {
//        _kepitolsSubject.sink.add(kapitels);
//      }
//    });

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
