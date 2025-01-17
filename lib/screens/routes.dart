import 'package:dioc/dioc.dart' as dioc;
import 'package:doc_ueberall/model/kapitelDetails.dart';
import 'package:doc_ueberall/model/kapitels.dart';
import 'package:doc_ueberall/screens/ArticlesList/articleList.dart';
import 'package:doc_ueberall/screens/DashBoard/DashBoard.dart';
import 'package:doc_ueberall/screens/DetailScreen/DetailScreen.dart';
import 'package:doc_ueberall/screens/DetailScreen/viewModel/DetailScreenViewModel.dart';
import 'package:doc_ueberall/screens/GespeicherteArtikel/GespeicherteArtikel.dart';
import 'package:doc_ueberall/screens/KapitelInhalte/KapitelInhalte.dart';
import 'package:doc_ueberall/screens/ZuletztGesehen/ZuletztGesehen.dart';
import 'package:doc_ueberall/screens/kepitel/viewModel/kepitelViewModel.dart';
import 'package:doc_ueberall/viewModelProvider/ViewModelProvider.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import 'DashBoard/viewModel/DashBoardViewModel.dart';

class AppRoutes {
  static const String KEPITOL = "/kepitol";
  static const String HOME = "/home";
  static const String DETAILPAGE = "/detailpage";
  static const String ARTICLE_LIST = "/articlelist";
  static const String SEARCH_LIST = "/searchlist";
  static const String KAPITELINHALTE = "/kapitelinhalte";
  static const String GESPEICHERTE_ARTIKELS = "/GespeicherteArtikels";
  static const String ZULETST_GESEHEN = "/ZuletstGesehen";

  static get routes => {
//        AppRoutes.KEPITOL: (context) {
//          var viewModel = c.get<KepitolsViewModel>(
//              creator: "KepitolsViewModel", mode: dioc.InjectMode.singleton);
//          return ViewModelProvider<KepitolsViewModel>(
//            child: KapitolScreen(),
//            viewmodel: viewModel,
//          );
//        },
        AppRoutes.HOME: (context) {
          var viewModel = c.get<DashBoardViewModel>(
              creator: "DashBoardViewModel", mode: dioc.InjectMode.singleton);
          return ViewModelProvider<DashBoardViewModel>(
            child: HomeScreen(),
            viewmodel: viewModel,
          );
        },
        AppRoutes.KAPITELINHALTE: (context) {
          Kapitel kapitel;
          if (ModalRoute.of(context).isCurrent) {
            kapitel =
                (ModalRoute.of(context).settings.arguments as Map)['kapitel'];
          }
          return ViewModelProvider<KepitolsViewModel>(
            child: KapitelInhalte(kapitel: kapitel),
            viewmodel: c.get<KepitolsViewModel>(
                creator: "KepitolsViewModel", mode: dioc.InjectMode.singleton),
          );
        },
        AppRoutes.DETAILPAGE: (context) {
          Details detail;
          int totalDetails;
          int kapitelInt;
          int topicInt;
          if (ModalRoute.of(context).isCurrent) {
            detail =
                (ModalRoute.of(context).settings.arguments as Map)['detail'];
            totalDetails = (ModalRoute.of(context).settings.arguments
                as Map)['total_details'];
            kapitelInt = (ModalRoute.of(context).settings.arguments
                as Map)['kapitel_int'];
            topicInt =
                (ModalRoute.of(context).settings.arguments as Map)['topic_int'];
          }
          var viewModel = c.get<DetailScreenViewModel>(
              creator: "DetailScreenViewModel",
              mode: dioc.InjectMode.singleton);
          viewModel.justSaw(detail);
          detail.isSeen = true;
          return ViewModelProvider<DetailScreenViewModel>(
            child: DetailPage(
              detail: detail,
              kapitelInt: kapitelInt,
              topicInt: topicInt,
              totalDetails: totalDetails,
            ),
            viewmodel: viewModel,
          );
        },
        AppRoutes.ARTICLE_LIST: (context) {
          Kapitel kapitel;
          String thId;
          if (ModalRoute.of(context).isCurrent) {
            thId = (ModalRoute.of(context).settings.arguments as Map)['th_id'];
            kapitel =
                (ModalRoute.of(context).settings.arguments as Map)['kapitel'];
          }
          return ViewModelProvider<DetailScreenViewModel>(
            child: ArticleList(
              kapitel: kapitel,
              thId: thId,
            ),
            viewmodel: c.get<DetailScreenViewModel>(
                creator: "DetailScreenViewModel", mode: dioc.InjectMode.create),
          );
        },
        AppRoutes.GESPEICHERTE_ARTIKELS: (context) {
          return ViewModelProvider<DetailScreenViewModel>(
            child: GespeicherteArtikels(),
            viewmodel: c.get<DetailScreenViewModel>(
                creator: "DetailScreenViewModel", mode: dioc.InjectMode.create),
          );
        },
        AppRoutes.ZULETST_GESEHEN: (context) {
          return ViewModelProvider<DetailScreenViewModel>(
            child: ZuletztGesehen(),
            viewmodel: c.get<DetailScreenViewModel>(
                creator: "DetailScreenViewModel", mode: dioc.InjectMode.create),
          );
        },
//        AppRoutes.SEARCH_LIST: (context) {
//          String searchStr;
//          if (ModalRoute.of(context).isCurrent) {
//            searchStr = (ModalRoute.of(context).settings.arguments
//                as Map)['search_string'];
//          }
//          return ViewModelProvider<DetailScreenViewModel>(
//            child: SearchedArtikels(
//              searchStr: searchStr,
//            ),
//            viewmodel: c.get<DetailScreenViewModel>(
//                creator: "DetailScreenViewModel", mode: dioc.InjectMode.create),
//          );
//        },
      };
}
