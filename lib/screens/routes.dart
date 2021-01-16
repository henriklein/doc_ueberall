import 'package:dioc/dioc.dart' as dioc;
import 'package:doc_ueberall/screens/DashBoard/DashBoard.dart';
import 'package:doc_ueberall/screens/DetailScreen/DetailScreen.dart';
import 'package:doc_ueberall/screens/DetailScreen/viewModel/DetailScreenViewModel.dart';
import 'package:doc_ueberall/screens/KapitelInhalte/KapitelInhalte.dart';
import 'package:doc_ueberall/screens/KapitelInhalte/viewModel/kapitelInhalteViewModel.dart';
import 'package:doc_ueberall/screens/kepitel/kapitel.dart';
import 'package:doc_ueberall/screens/kepitel/viewModel/kepitelViewModel.dart';
import 'package:doc_ueberall/viewModelProvider/ViewModelProvider.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import 'DashBoard/viewModel/DashBoardViewModel.dart';

class AppRoutes {
  static const String KEPITOL = "/kepitol";
  static const String HOME = "/home";
  static const String DETAILPAGE = "/detailpage";
  static const String KAPITELINHALTE = "/kapitelinhalte";

  static get routes => {
        AppRoutes.KEPITOL: (context) {
          var viewModel = c.get<KepitolsViewModel>(
              creator: "KepitolsViewModel", mode: dioc.InjectMode.singleton);
          return ViewModelProvider<KepitolsViewModel>(
            child: KapitolScreen(),
            viewmodel: viewModel,
          );
        },
        AppRoutes.HOME: (context) {
          var viewModel = c.get<DashBoardViewModel>(
              creator: "DashBoardViewModel", mode: dioc.InjectMode.singleton);
          return ViewModelProvider<DashBoardViewModel>(
            child: HomeScreen(),
            viewmodel: viewModel,
          );
        },
        AppRoutes.KAPITELINHALTE: (context) {
          String id;
          if (ModalRoute.of(context).isCurrent) {
            id = (ModalRoute.of(context).settings.arguments as Map)['id'];
          }
          return ViewModelProvider<KepitolsViewModel>(
            child: KapitelInhalte(id: id),
            viewmodel: c.get<KepitolsViewModel>(
                creator: "KepitolsViewModel", mode: dioc.InjectMode.singleton),
          );
        },
        AppRoutes.DETAILPAGE: (context) {
          String id;
          if (ModalRoute.of(context).isCurrent) {
            id = (ModalRoute.of(context).settings.arguments as Map)['id'];
          }
          return ViewModelProvider<DetailScreenViewModel>(
            child: DetailPage(id: id),
            viewmodel: c.get<DetailScreenViewModel>(
                creator: "DetailScreenViewModel", mode: dioc.InjectMode.create),
          );
        },
      };
}
