import 'package:doc_ueberall/data/firebaseDetailScreenDataSource.dart';
import 'package:doc_ueberall/model/detailScreen.dart';
import 'package:doc_ueberall/viewModelProvider/ViewModelProvider.dart';
import 'package:rxdart/rxdart.dart';

class DetailScreenViewModel extends ViewModelBase {
  final FirebaseDetailScreenDataSource _detailScreenDataSource;

  final BehaviorSubject<DetailScreen> _detailScreenSubject = BehaviorSubject();

  Stream<DetailScreen> get outDetailScreen => _detailScreenDataSource.outDetailScreen;

  DetailScreenViewModel(this._detailScreenDataSource);

  @override
  void dispose() {
    _detailScreenSubject.close();
  }
}
