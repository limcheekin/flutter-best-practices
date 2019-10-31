import '../../core/models/post.dart';

import '../../core/services/api.dart';

import '../../locator.dart';
import '../view_state.dart';
import 'base_model.dart';

class HomeModel extends BaseModel {
  Api _api = locator<Api>();

  List<Post> posts;

  Future getPosts(int userId) async {
    setState(ViewState.Busy);
    posts = await _api.getPostsForUser(userId);
    setState(ViewState.Idle);
  }
}