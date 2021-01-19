import 'package:doc_ueberall/data/firebaseDetailScreenDataSource.dart';
import 'package:doc_ueberall/model/kapitelDetails.dart';
import 'package:doc_ueberall/viewModelProvider/ViewModelProvider.dart';
import 'package:rxdart/rxdart.dart';

class DetailScreenViewModel extends ViewModelBase {
  final FirebaseDetailScreenDataSource _detailScreenDataSource;

  final BehaviorSubject<Details> _detailsSubject = BehaviorSubject();

  Stream<Details> get outDetailScreen => _detailsSubject.stream;

  DetailScreenViewModel(this._detailScreenDataSource);

  getDetails(String kapitelId) async {
    var detail = await _detailScreenDataSource.getDetails(kapitelId);
    _detailsSubject.add(detail);
  }

  @override
  void dispose() {
    _detailsSubject.close();
  }
}
