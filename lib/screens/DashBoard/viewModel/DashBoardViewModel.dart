import 'package:doc_ueberall/data/firebaseDashBoardDataSource.dart';
import 'package:doc_ueberall/model/dashBoard.dart';
import 'package:doc_ueberall/viewModelProvider/ViewModelProvider.dart';
import 'package:rxdart/rxdart.dart';

class DashBoardViewModel extends ViewModelBase {
  final FirebaseDashBoardDataSource _dashBoardDataSource;

  final BehaviorSubject<DashBoards> _dashBoardSubject = BehaviorSubject();

  Stream<DashBoards> get outDashBoard => _dashBoardDataSource.outDashBoard;

  DashBoardViewModel(this._dashBoardDataSource);

  @override
  void dispose() {
    _dashBoardSubject.close();
  }
}
