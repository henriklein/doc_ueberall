import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doc_ueberall/model/dashBoard.dart';
import 'package:rxdart/rxdart.dart';

class FirebaseDashBoardDataSource {
  final Firestore fStore;

  final BehaviorSubject<DashBoards> _dashBoardSubject = BehaviorSubject();
  Stream<DashBoards> get outDashBoard => _dashBoardSubject.stream;

  FirebaseDashBoardDataSource(this.fStore) {
    fStore.collection("DashBoard").getDocuments().then((querySnapshot) {
      print(
          "querySnapshot.documents.first.data ${querySnapshot.documents.first.data}");
      _dashBoardSubject.sink
          .add(DashBoards.fromJson(querySnapshot.documents.first.data));
    });
  }

  void dispose() {
    _dashBoardSubject.drain();
  }

}
