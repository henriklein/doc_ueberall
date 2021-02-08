import 'package:doc_ueberall/data/firebaseDetailScreenDataSource.dart';
import 'package:doc_ueberall/model/kapitelDetails.dart';
import 'package:doc_ueberall/viewModelProvider/ViewModelProvider.dart';
import 'package:rxdart/rxdart.dart';

class DetailScreenViewModel extends ViewModelBase {
  final FirebaseDetailScreenDataSource _detailScreenDataSource;

//  final BehaviorSubject<List<Details>> _detailsSubject = BehaviorSubject();

  Stream<List<Details>> get outDetailScreen =>
      _detailScreenDataSource.outDetailScreen;

  DetailScreenViewModel(this._detailScreenDataSource);

  bookMark(Details details) {
    _detailScreenDataSource.bookMark(details);
  }

  seen(Details details) {
    _detailScreenDataSource.seen(details);
  }

  justSaw(Details detail) {
    _detailScreenDataSource.justSaw(detail);
  }

//  getDetails(String th_id) {
//    var detail = _detailScreenDataSource.getDetails(th_id);
////    _detailsSubject.sink.add(detail);
//  }
//
//  getBookMarkedDetails() {
//    var detail = _detailScreenDataSource.getBookMarkedDetails();
////    _detailsSubject.sink.add(detail);
//  }

  getNextDetails(int currentIndex) {
    var detail = _detailScreenDataSource.outDetailScreen.listen((event) {
      event.where((element) => element.index > currentIndex).toList()
        ..sort((workA, workB) => workA.index.compareTo(workB.index));
    });
//        .where((element) => element.index > currentIndex)
//        .toList()
//      ..sort((workA, workB) => workA.index.compareTo(workB.index));
//    var detail = _detailsSubject.value
//        .where((element) => element.index > currentIndex)
//        .toList()
//          ..sort((workA, workB) => workA.index.compareTo(workB.index));
//    return detail.first;
  }

  @override
  void dispose() {
// nothing to dispose
  }
}
