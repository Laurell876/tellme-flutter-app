import 'package:flutter/material.dart';


class MyConstants extends InheritedWidget {
  static MyConstants of(BuildContext context) => context. dependOnInheritedWidgetOfExactType<MyConstants>();

  const MyConstants({Widget child, Key key}): super(key: key, child: child);

  final String SERVER_IP = 'http://127.0.0.1:3000';

  @override
  bool updateShouldNotify(MyConstants oldWidget) => false;
}