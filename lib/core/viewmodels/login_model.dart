import 'package:flutter/foundation.dart';

import '../../locator.dart';
import '../services/authentication_service.dart';
import '../view_state.dart';
import 'base_model.dart';

class LoginModel extends BaseModel {
  final AuthenticationService _authenticationService = locator<AuthenticationService>();
  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  Future<bool> login(String userIdText) async {
    setState(ViewState.Busy);

    var userId = int.tryParse(userIdText);
    var success = await _authenticationService.login(userId);

    setState(ViewState.Idle);
    return success;
  }
}
