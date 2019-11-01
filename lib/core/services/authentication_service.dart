import 'dart:async';

import 'package:flutter/foundation.dart';

import '../../core/models/user.dart';

import 'api.dart';

class AuthenticationService {
  // Inject our Api
  Api _api;

  AuthenticationService({@required Api api}): _api = api;

  StreamController<User> userController = StreamController<User>();

  Stream<User> get user => userController.stream;

  Future<bool> login(int userId) async {
    // Get the user profile for id
    var fetcheduser = await _api.getUserProfile(userId);

    // Check if success
    var hasUser = fetcheduser != null;

    if (hasUser) {
      userController.add(fetcheduser);
    }

    return hasUser;
  }
}
