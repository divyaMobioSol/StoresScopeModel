import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:new_scope_model/Enum/enum.dart';
import 'package:new_scope_model/Scope_model/scope_model.dart';
import 'package:new_scope_model/model.dart';
import 'package:scoped_model/scoped_model.dart';

import 'listItemWidget.dart';

class HomePage extends StatefulWidget {
  final HomeModel homeModel;

  const HomePage({super.key, required this.homeModel});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //const HomePage({Key? key}) : super(key: key);
  // currentState? CurrentState;
 //HomeModel model = HomeModel();
  // Future<List<Store>> storesdata = [];

  @override
  void initState() {
    loadData();
    super.initState();
  }

  Future loadData() async {
    widget.homeModel.fetchStore();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Scoped Model')),
        body:
            ScopedModelDescendant<HomeModel>(builder: ((context, child, model) {
          if (model.state == currentState.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (model.state == currentState.empty) {
            return const Center(
              child: Text('No data found'),
            );
          }
          if (model.state == currentState.error) {
            return const Center(
              child: Text('Something went wrong'),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: model.stores.length,
                  itemBuilder: (BuildContext ctx, int i) {
                    return ListItem(
                        title: model.stores[i].title,
                        description: model.stores[i].description,
                        price: model.stores[i].price.toString(),
                        imageString: model.stores[i].image,
                        rating: model.stores[i].rating!.rate);
                  }),
            );
          }
        })));
  }
}
