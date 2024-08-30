import 'package:blog_explorer/bloc/blog_event.dart';
import 'package:blog_explorer/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/blog_bloc.dart';
import 'data/blog_repository.dart';

void main() {
  final BlogRepository blogRepository = BlogRepository();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) =>
            BlogBloc(blogRepository: blogRepository)..add(FetchBlogs()),
        child: SplashScreen(),
      ),
    ),
  );
}
