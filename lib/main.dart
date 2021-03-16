import 'package:doc_ueberall/di/injects.dart';
import 'package:doc_ueberall/screens/DashBoard/viewModel/DashBoardViewModel.dart';
import 'package:doc_ueberall/screens/routes.dart';
import 'package:doc_ueberall/viewModelProvider/ViewModelProvider.dart';
import 'package:flutter/material.dart';
import 'package:doc_ueberall/screens/DashBoard/DashBoard.dart';
import 'package:dioc/dioc.dart' as dioc;

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doc überall',
      routes: AppRoutes.routes,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ViewModelProvider<DashBoardViewModel>(
        child: HomeScreen(),
        viewmodel: c.get<DashBoardViewModel>(
            creator: "DashBoardViewModel", mode: dioc.InjectMode.create),
      ),
    );
  }
}

final dioc.Container c = InitDependencies().container;
