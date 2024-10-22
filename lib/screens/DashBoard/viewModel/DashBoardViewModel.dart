import 'package:doc_ueberall/data/firebaseDetailScreenDataSource.dart';
import 'package:doc_ueberall/data/firebaseKepitelsDataSource.dart';
import 'package:doc_ueberall/model/kapitelDetails.dart';
import 'package:doc_ueberall/model/kapitels.dart';
import 'package:doc_ueberall/viewModelProvider/ViewModelProvider.dart';

class DashBoardViewModel extends ViewModelBase {
  final FirebaseKepitelsDataSource _kepitelsDataSource;
  final FirebaseDetailScreenDataSource _detailScreenDataSource;

  Stream<Kapitels> get outKepitols => _kepitelsDataSource.outKapitels;

  Stream<List<Details>> get outDetailScreen =>
      _detailScreenDataSource.outDetailScreen;

  DashBoardViewModel(this._kepitelsDataSource, this._detailScreenDataSource);

  @override
  void dispose() {
//    nothing to close
  }
}
