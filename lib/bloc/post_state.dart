import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
@immutable
abstract class PostState{}

class PostInitialState extends PostState{}
class PostLoadingState extends  PostState{}
class PostLoadedState extends PostState{
  final dynamic response ;
  PostLoadedState({@required this.response});
}
class PostErrorState extends PostState{
  final String error ;
  PostErrorState({@required this.error});
}