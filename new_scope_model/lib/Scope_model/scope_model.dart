import 'package:flutter/cupertino.dart';
import 'package:new_scope_model/Enum/enum.dart';
import 'package:new_scope_model/http/http.dart';
import 'package:new_scope_model/model.dart';
import 'package:scoped_model/scoped_model.dart';

class HomeModel extends Model {
// static CounterModel of(BuildContext context) =>
//       ScopedModel.of<CounterModel>(context);

  // static HomeModel of(BuildContext context) {
  //   ScopedModel.of<HomeModel>(context);
  // }

  currentState state = currentState.loading;

  List<Store> stores = [];

  Future<List<Store>> fetchStore() async {
    try {
      const url = 'https://fakestoreapi.com/products';
      state = currentState.loading;
      var res = await HttpMethods.getHttpMethods(url);
      print(res);
      if (res == null) {
        state = currentState.empty;
        notifyListeners();
      } else {
        stores = storeFromMap(res);
        if (stores.isEmpty) {
          state = currentState.empty;
          notifyListeners();
        } else {
          state = currentState.dataRecieved;
          notifyListeners();
        }
      }
    } catch (e) {
      state = currentState.error;
      print(e.toString());
    }
    return stores;
  }
}
