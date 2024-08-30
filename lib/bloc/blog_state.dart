import '../models/blog.dart';

abstract class BlogState {}

class BlogsInitial extends BlogState {}

class BlogsLoading extends BlogState {}

class BlogsLoaded extends BlogState {
  final List<Blog> blogs;

  BlogsLoaded({required this.blogs});
}

class BlogsLoadFailed extends BlogState {
  final String error;

  BlogsLoadFailed({required this.error});
}

class BlogUpdated extends BlogState {
  final Blog updatedBlog;

  BlogUpdated({required this.updatedBlog});
}

class BlogImageLoading extends BlogState {}

class BlogImageLoaded extends BlogState {
  final String imageUrl;

  BlogImageLoaded(this.imageUrl);
}

class BlogImageLoadFailed extends BlogState {
  final String error;

  BlogImageLoadFailed({required this.error});
}
