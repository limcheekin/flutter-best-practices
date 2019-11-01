import 'package:flutter/foundation.dart';
import '../../core/models/comment.dart';
import '../../core/services/api.dart';
import '../view_state.dart';
import 'base_model.dart';

class CommentsModel extends BaseModel {
  Api _api;

  CommentsModel({@required Api api}): _api = api;

  List<Comment> comments;

  Future fetchComments(int postId) async {
    setState(ViewState.Busy);
    comments = await _api.getCommentsForPost(postId);
    setState(ViewState.Idle);
  }
}
