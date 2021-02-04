import 'package:doc_ueberall/data/firebaseDetailScreenDataSource.dart';
import 'package:doc_ueberall/data/firebaseKepitelsDataSource.dart';
import 'package:doc_ueberall/model/kapitelDetails.dart';
import 'package:doc_ueberall/viewModelProvider/ViewModelProvider.dart';
import 'package:rxdart/rxdart.dart';

class DashBoardViewModel extends ViewModelBase {
  final FirebaseKepitelsDataSource _kepitelsDataSource;
  final FirebaseDetailScreenDataSource _detailScreenDataSource;

  final BehaviorSubject<List<Details>> _detailsSubject = BehaviorSubject();
  Stream<List<Details>> get outDetailScreen => _detailsSubject.stream;

  DashBoardViewModel(this._kepitelsDataSource, this._detailScreenDataSource);

  getBookMarkedDetails() {
    var detail = _detailScreenDataSource.getBookMarkedDetails();
    _detailsSubject.sink.add(detail);
  }

  @override
  void dispose() {
//    nothing to close
  }
}
