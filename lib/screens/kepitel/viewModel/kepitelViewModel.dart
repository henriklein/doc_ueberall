import 'package:doc_ueberall/data/firebaseKepitelsDataSource.dart';
import 'package:doc_ueberall/model/kapitels.dart';
import 'package:doc_ueberall/viewModelProvider/ViewModelProvider.dart';
import 'package:rxdart/rxdart.dart';

class KepitolsViewModel extends ViewModelBase {
  final FirebaseKepitelsDataSource _kepitelsDataSource;

  final BehaviorSubject<Kepitels> _kepitolsSubject = BehaviorSubject();

  Stream<Kepitels> get outKepitols => _kepitelsDataSource.outZuletztGesehen;

  KepitolsViewModel(this._kepitelsDataSource);

  @override
  void dispose() {
    _kepitolsSubject.close();
  }
}
