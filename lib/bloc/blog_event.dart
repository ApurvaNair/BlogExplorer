import 'package:blog_explorer/models/blog.dart';

abstract class BlogEvent {}

class FetchBlogs extends BlogEvent {}

class ToggleFavoriteStatus extends BlogEvent {
  final Blog blog;

  ToggleFavoriteStatus(this.blog);
}

class LoadBlogImage extends BlogEvent {
  final String imageUrl;

  LoadBlogImage(this.imageUrl);
}
