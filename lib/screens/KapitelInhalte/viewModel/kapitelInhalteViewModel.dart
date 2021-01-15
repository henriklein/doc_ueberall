import 'package:doc_ueberall/data/firebaseKapitelInhalteDataSource.dart';
import 'package:doc_ueberall/model/kapitelInhalte.dart';
import 'package:doc_ueberall/viewModelProvider/ViewModelProvider.dart';
import 'package:rxdart/rxdart.dart';

class KapitelInhaltesViewModel extends ViewModelBase {
  final FirebaseKapitelInhalteDataSource _kapitelInhaltesDataSource;

  final BehaviorSubject<KapitelInhaltes> _kapitelInhaltesSubject = BehaviorSubject();

  Stream<KapitelInhaltes> get outKapitelInhaltes => _kapitelInhaltesDataSource.outKapitelInhaltes;

  KapitelInhaltesViewModel(this._kapitelInhaltesDataSource);

  @override
  void dispose() {
    _kapitelInhaltesSubject.close();
  }
}
