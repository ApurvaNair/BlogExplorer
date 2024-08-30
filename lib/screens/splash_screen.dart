import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blog_explorer/bloc/blog_bloc.dart';
import 'package:blog_explorer/data/blog_repository.dart';
import 'blog_list_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 3), () {});

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (context) => BlogBloc(blogRepository: BlogRepository()),
          child: BlogListScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/subspace.png',
              height: 200,
              width: 200,
            ),
            SizedBox(height: 20),
            Text('Blog Explorer',
                style: TextStyle(color: Colors.white, fontSize: 30)),
          ],
        ),
      ),
    );
  }
}
