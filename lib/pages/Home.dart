import 'dart:convert';
import 'package:bloc_pattern/bloc/post_bloc.dart';
import 'package:bloc_pattern/bloc/post_event.dart';
import 'package:bloc_pattern/bloc/post_state.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    PostBloc _postBloc = BlocProvider.of<PostBloc>(context);
    _postBloc.add(FetchPostsEvent());
    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc Pattern"),
      ),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is PostLoadingState) {
            print("loading");
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PostLoadedState) {
            print("loaded");
            return FutureBuilder<Response>(
              future: state.response,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  print("future data");
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  List posts = json.decode(snapshot.data.bodyString);
                  return ListView.builder(
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Card(
                          child: ListTile(
                            title: Text(
                              posts[index]["id"].toString(),
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              posts[index]["title"],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            );
          } else if (state is PostErrorState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
