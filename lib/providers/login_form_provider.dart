import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {
  //usamos  globalkey para conectar el form a un objeto
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  bool _isLoading = false;

  bool get isLoading {
    return this._isLoading;
  }

  set isLoading(bool value) {
    this._isLoading = value;
    notifyListeners();
  }

  bool isValidForm() {
    print(formKey.currentState?.validate() ?? false);

    print("$email - $password");

    return formKey.currentState?.validate() ?? false;
  }
}
