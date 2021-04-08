import 'package:chopper/chopper.dart';
part 'post_api_services.chopper.dart';

@ChopperApi(baseUrl: '/posts')
abstract class PostApiServices extends ChopperService{

  // get all posts from server
  @Get()
  Future<Response> getAllPosts();

  // get special post from server
  @Get(path: '/{id}')
  Future<Response> getSpecialPost(@Path() int id);

  // send post to server
  @Post()
  Future<Response> sendPost(@Body() Map<String,dynamic> data);

  // delete post from server
  @Delete(path: '/{id}')
  Future<Response> deletePost(@Path() int id);

  // update post
  @Put(path: '/{id}')
  Future<Response> updatePost(@Path() int id, @Body() Map<String,dynamic> data);

  // make request to server and create instance from this abstract class
  static PostApiServices create(){
    final client = ChopperClient(
      baseUrl: 'https://jsonplaceholder.typicode.com',
      services: [_$PostApiServices()],
      converter: JsonConverter(),
    );
    return _$PostApiServices(client);
  }
}