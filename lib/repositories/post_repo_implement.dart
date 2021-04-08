import 'package:bloc_pattern/api_services/post_api_services.dart';
import 'package:bloc_pattern/repositories/post_repo_model.dart';
import 'package:chopper/chopper.dart';

class PostRepoImplement extends PostRepositoryModel {
  PostApiServices _postApiServices = PostApiServices.create();

  @override
  deletePost(id) {
    Future<Response> response = _postApiServices.deletePost(id);
    return response;
  }

  @override
  getPosts() {
    Future<Response> response = _postApiServices.getAllPosts();
    return response;
  }

  @override
  specialPost(id) {
    Future<Response> response = _postApiServices.getSpecialPost(id);
    return response;
  }

  @override
  setPost(model) {
    Future<Response> response = _postApiServices.sendPost(model);
    return response;
  }

  @override
  updatePost(id, model) {
    Future<Response> response = _postApiServices.updatePost(id, model);
    return response;
  }
}
