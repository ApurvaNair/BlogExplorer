import 'package:flutter_bloc/flutter_bloc.dart';
import 'blog_event.dart';
import 'blog_state.dart';
import '../data/blog_repository.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  final BlogRepository blogRepository;

  BlogBloc({required this.blogRepository}) : super(BlogsInitial()) {
    on<FetchBlogs>((event, emit) async {
      emit(BlogsLoading());
      try {
        final blogs = await blogRepository.fetchBlogs();
        emit(BlogsLoaded(blogs: blogs));
      } catch (e) {
        emit(BlogsLoadFailed(error: e.toString()));
      }
    });

    on<LoadBlogImage>((event, emit) async {
      emit(BlogImageLoading());
      try {
        await Future.delayed(Duration(seconds: 2));
        emit(BlogImageLoaded(event.imageUrl));
      } catch (e) {
        emit(BlogImageLoadFailed(error: e.toString()));
      }
    });
  }
}
