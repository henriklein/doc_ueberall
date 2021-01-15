import 'package:flutter/material.dart';

abstract class ViewModelBase {
  void dispose();
}

class ViewModelProvider<T extends ViewModelBase> extends StatefulWidget {
  ViewModelProvider({
    Key key,
    @required this.child,
    @required this.viewmodel,
  }): super(key: key);

  final T viewmodel;
  final Widget child;

  @override
  _ViewModelProviderState<T> createState() => _ViewModelProviderState<T>();

  static T of<T extends ViewModelBase>(BuildContext context){
    ViewModelProvider<T> provider = context.findAncestorWidgetOfExactType<ViewModelProvider<T>>();
    return provider.viewmodel;
  }

  void dispose(){
    viewmodel.dispose();
  }
//  static Type _typeOf<T>() => T;
}

class _ViewModelProviderState<T> extends State<ViewModelProvider<ViewModelBase>>{

  @override
  Widget build(BuildContext context){
    return widget.child;
  }

  @override
  void dispose(){
    super.dispose();
    widget.dispose();
  }

}