import 'package:bloc_pattern/bloc/post_bloc.dart';
import 'package:bloc_pattern/pages/Home.dart';
import 'package:bloc_pattern/repositories/post_repo_implement.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

main() {
  runApp(BlocPattern());
}

class BlocPattern extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:BlocProvider<PostBloc>(
        create: (context) => PostBloc(postRepo: PostRepoImplement()),
        child: Home(),
      ),
    );
  }
}
