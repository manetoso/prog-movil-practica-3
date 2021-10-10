import 'package:flutter/material.dart';

class TaskFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  String title = '';
  String desc = '';
  String date = '';
  bool check = false;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading( bool value ) {
    this._isLoading = value;
    notifyListeners();
  }
}