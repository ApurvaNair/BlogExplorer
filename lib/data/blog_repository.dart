import 'dart:convert';
import 'package:blog_explorer/models/blog.dart';
import 'package:http/http.dart' as http;

class BlogRepository {
  final String apiUrl = 'https://intent-kit-16.hasura.app/api/rest/blogs';
  final String adminSecret =
      '32qR4KmXOIpsGPQKMqEJHGJS27G5s7HdSKO3gdtQd2kv5e852SiYwWNfxkZOBuQ6';

  Future<List<Blog>> fetchBlogs() async {
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {'x-hasura-admin-secret': adminSecret},
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List blogsJson = data['blogs'];
        return blogsJson.map((json) => Blog.fromJson(json)).toList();
      } else {
        throw Exception(
            'Failed to load blogs. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load blogs: $e');
    }
  }
}
