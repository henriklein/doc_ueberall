import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dioc/dioc.dart';
import 'package:doc_ueberall/data/firebaseDashBoardDataSource.dart';
import 'package:doc_ueberall/data/firebaseDetailScreenDataSource.dart';
import 'package:doc_ueberall/data/firebaseKapitelInhalteDataSource.dart';
import 'package:doc_ueberall/data/firebaseKepitelsDataSource.dart';
import 'package:doc_ueberall/screens/DashBoard/viewModel/DashBoardViewModel.dart';
import 'package:doc_ueberall/screens/DetailScreen/viewModel/DetailScreenViewModel.dart';
import 'package:doc_ueberall/screens/KapitelInhalte/viewModel/kapitelInhalteViewModel.dart';
import 'package:doc_ueberall/screens/kepitel/viewModel/kepitelViewModel.dart';

class InitDependencies {
  final container = Container();

  InitDependencies() {
    //Firebase
    container.register<Firestore>((c) {
      return Firestore.instance;
    }, name: "Firestore", defaultMode: InjectMode.singleton);

    //Firebase DataSource Implementations
    container.register<FirebaseKepitelsDataSource>((c) {
      print("FirebaseKepitelsDataSource registered");
      return FirebaseKepitelsDataSource(c.get<Firestore>(creator: "Firestore"));
    }, name: "FirebaseKepitelsDataSource", defaultMode: InjectMode.create);
    container.register<FirebaseKapitelInhalteDataSource>((c) {
      print("FirebaseKapitelInhalteDataSource registered");
      return FirebaseKapitelInhalteDataSource(c.get<Firestore>(creator: "Firestore"));
    }, name: "FirebaseKapitelInhalteDataSource", defaultMode: InjectMode.create);
    container.register<FirebaseDetailScreenDataSource>((c) {
      print("FirebaseDetailScreenDataSource registered");
      return FirebaseDetailScreenDataSource(c.get<Firestore>(creator: "Firestore"));
    }, name: "FirebaseDetailScreenDataSource", defaultMode: InjectMode.create);

    container.register<FirebaseDashBoardDataSource>((c) {
      print("FirebaseDashBoardDataSource registered");
      return FirebaseDashBoardDataSource(c.get<Firestore>(creator: "Firestore"));
    }, name: "FirebaseDashBoardDataSource", defaultMode: InjectMode.create);
    
    container.register<KepitolsViewModel>((c) {
      print("KepitolsViewModel registered");
      return KepitolsViewModel(c.get<FirebaseKepitelsDataSource>(
          creator: "FirebaseKepitelsDataSource"));
    }, name: "KepitolsViewModel", defaultMode: InjectMode.singleton);
    container.register<KapitelInhaltesViewModel>((c) {
      print("KapitelInhaltesViewModel registered");
      return KapitelInhaltesViewModel(c.get<FirebaseKapitelInhalteDataSource>(
          creator: "FirebaseKapitelInhalteDataSource"));
    }, name: "KapitelInhaltesViewModel", defaultMode: InjectMode.singleton);
    container.register<DashBoardViewModel>((c) {
      print("DashBoardViewModel registered");
      return DashBoardViewModel(c.get<FirebaseDashBoardDataSource>(
          creator: "FirebaseDashBoardDataSource"));
    }, name: "DashBoardViewModel", defaultMode: InjectMode.singleton);
    container.register<DetailScreenViewModel>((c) {
      print("DetailScreenViewModel registered");
      return DetailScreenViewModel(c.get<FirebaseDetailScreenDataSource>(
          creator: "FirebaseDetailScreenDataSource"));
    }, name: "DetailScreenViewModel", defaultMode: InjectMode.singleton);

//    
//    container.register<ThemasViewModel>((c) {
//      print("ThemasViewModel registered");
//      return ThemasViewModel(c.get<FirebaseThemasDataSource>(
//          creator: "FirebaseThemasDataSource"));
//    }, name: "ThemasViewModel", defaultMode: InjectMode.singleton);
  }
}
