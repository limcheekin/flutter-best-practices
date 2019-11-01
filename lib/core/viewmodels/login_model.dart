import 'package:flutter/foundation.dart';

import '../services/authentication_service.dart';
import '../view_state.dart';
import 'base_model.dart';

class LoginModel extends BaseModel {
  AuthenticationService _authenticationService;
  String errorMessage;

  LoginModel({@required AuthenticationService authenticationService})
      : _authenticationService = authenticationService;

  Future<bool> login(String userIdText) async {
    setState(ViewState.Busy);

    var userId = int.tryParse(userIdText);

    if (userId == null) {
      errorMessage = 'Value entered is not a number';
      setState(ViewState.Idle);
      return false;
    }

    var success = await _authenticationService.login(userId);

    setState(ViewState.Idle);
    return success;
  }
}
