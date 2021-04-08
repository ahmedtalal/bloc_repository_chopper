import 'package:bloc_pattern/bloc/post_event.dart';
import 'package:bloc_pattern/bloc/post_state.dart';
import 'package:bloc_pattern/repositories/post_repo_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostBloc extends Bloc<PostEvent,PostState>{
  PostRepositoryModel postRepo ;
  PostBloc({@required this.postRepo}) : super(PostInitialState());

  @override
  Stream<PostState> mapEventToState(PostEvent event) async*{
    if(event is FetchPostsEvent){
      yield PostLoadingState();
      try{
        final response = postRepo.getPosts();
        yield PostLoadedState(response: response);
      }catch(error){
        yield PostErrorState(error: error.toString());
      }
    }
  }
  
}