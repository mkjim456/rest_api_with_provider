import 'package:flutter/material.dart';
import 'package:rest_api_with_provider/model/data_model.dart';

class AppState extends ChangeNotifier {
  //Provider working with restApi

  List<DataModel> datalist = [];

  void updateDatamodel(List<DataModel> datalist) {
    this.datalist = datalist;
    notifyListeners();
  }
}
