

import '../../locator.dart';
import '../services/authentication_service.dart';
import '../view_state.dart';
import 'base_model.dart';

class LoginModel extends BaseModel {
  final AuthenticationService _authenticationService = locator<AuthenticationService>();
  ViewState _state = ViewState.Idle;
  ViewState get state => _state;
  String errorMessage;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  Future<bool> login(String userIdText) async {
    setState(ViewState.Busy);

    var userId = int.tryParse(userIdText);

    if(userId == null) {
        errorMessage = 'Value entered is not a number';
        setState(ViewState.Idle);
        return false;
    }

    var success = await _authenticationService.login(userId);

    setState(ViewState.Idle);
    return success;
  }
}
