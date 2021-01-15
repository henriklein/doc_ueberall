import 'package:doc_ueberall/di/injects.dart';
import 'package:doc_ueberall/screens/routes.dart';
import 'package:flutter/material.dart';
import 'package:doc_ueberall/screens/DashBoard/DashBoard.dart';
import 'package:dioc/dioc.dart' as dioc;


void main() {
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
      home: HomeScreen(),
    );
  }
}

final dioc.Container c = InitDependencies().container;
