abstract class PostRepositoryModel {
  dynamic getPosts();
  dynamic specialPost(var id);
  dynamic setPost(var model);
  dynamic deletePost(var id);
  dynamic updatePost(var id,var model);
}