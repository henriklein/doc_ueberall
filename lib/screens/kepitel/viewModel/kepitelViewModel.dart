import 'package:doc_ueberall/data/firebaseKepitelsDataSource.dart';
import 'package:doc_ueberall/model/kapitels.dart';
import 'package:doc_ueberall/viewModelProvider/ViewModelProvider.dart';
import 'package:rxdart/rxdart.dart';

class KepitolsViewModel extends ViewModelBase {
  final FirebaseKepitelsDataSource _kepitelsDataSource;

  final BehaviorSubject<Kapitels> _kepitolsSubject = BehaviorSubject();

  Stream<Kapitels> get outKepitols => _kepitelsDataSource.outKapitels;

  KepitolsViewModel(this._kepitelsDataSource);

//  bookMark(Kapitel kapitel) {
//    _kepitelsDataSource.bookMark(kapitel);
//  }
//
//  seen(Kapitel kapitel) {
//    _kepitelsDataSource.seen(kapitel);
//  }

//  bookMarkInhalte(Kapitel kapitel, String th_id) {
//    _kepitelsDataSource.bookMarkThamengabeit(kapitel, th_id);
//  }
//
//  seenInhalte(Kapitel kapitel, String th_id) {
//    _kepitelsDataSource.seenThamengabeit(kapitel, th_id);
//  }

//  justSaw(Kapitel kapitel) {
//    _kepitelsDataSource.justSaw(kapitel);
//  }

//  justSawThamengabeit(Kapitel kapitel, String th_id) {
//    _kepitelsDataSource.justSawThamengabeit(kapitel, th_id);
//  }

  @override
  void dispose() {
    _kepitolsSubject.close();
  }
}
