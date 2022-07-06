import 'package:flutter/material.dart';

import 'package:new_scope_model/Scope_model/scope_model.dart';
import 'package:scoped_model/scoped_model.dart';

import 'homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   final homeModel = HomeModel();
    return ScopedModel<HomeModel>
   
    (
      model:
HomeModel(),

      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(homeModel: homeModel),
      ),
    );
  }
}
