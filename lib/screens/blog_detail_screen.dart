import 'package:flutter/material.dart';
import 'package:blog_explorer/models/blog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BlogDetailScreen extends StatefulWidget {
  final Blog blog;
  final bool isDarkMode;

  BlogDetailScreen({required this.blog, required this.isDarkMode});

  @override
  _BlogDetailScreenState createState() => _BlogDetailScreenState();
}

class _BlogDetailScreenState extends State<BlogDetailScreen> {
  bool _isFavorite = false;
  bool _showAnimation = false;

  @override
  void initState() {
    super.initState();
    _loadFavoriteStatus();
  }

  void _loadFavoriteStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final key = '${widget.blog.id}_favorite';

    setState(() {
      _isFavorite = prefs.getBool(key) ?? false;
    });
  }

  Future<void> _toggleFavorite() async {
    final prefs = await SharedPreferences.getInstance();
    final key = '${widget.blog.id}_favorite';

    if (!_isFavorite) {
      setState(() {
        _showAnimation = true;
      });

      Future.delayed(Duration(milliseconds: 1000), () {
        if (mounted) {
          setState(() {
            _showAnimation = false;
          });
        }
      });
    }

    setState(() {
      _isFavorite = !_isFavorite;
    });

    await prefs.setBool(key, _isFavorite);
  }

  @override
  Widget build(BuildContext context) {
    final blog = widget.blog;
    final isDarkMode = widget.isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: Text(blog.title),
        backgroundColor: isDarkMode ? Colors.black : Colors.teal,
        foregroundColor: Colors.white,
      ),
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ignore: unnecessary_null_comparison
          blog.imageUrl != null
              ? Image.network(
                  blog.imageUrl,
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, progress) {
                    if (progress == null) {
                      return child;
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: double.infinity,
                      height: 300,
                      color: Colors.grey,
                      child: Center(
                        child:
                            Icon(Icons.image, size: 100, color: Colors.white),
                      ),
                    );
                  },
                )
              : Container(
                  width: double.infinity,
                  height: 300,
                  color: Colors.grey,
                  child: Center(
                    child: Icon(Icons.image, size: 100, color: Colors.white),
                  ),
                ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              blog.title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                GestureDetector(
                  onTap: _toggleFavorite,
                  child: AnimatedScale(
                    scale: _showAnimation ? 1.2 : 1.0,
                    duration: Duration(milliseconds: 200),
                    child: Icon(
                      _isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: _isFavorite ? Colors.red : Colors.grey,
                      size: 36,
                    ),
                  ),
                ),
                if (_showAnimation)
                  Positioned(
                    top: 0,
                    child: Container(
                      width: 100,
                      height: 100,
                      child: Image.asset(
                        'assets/like_animation.gif',
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Text(
                  _isFavorite ? "Liked" : "Like this blog",
                  style: TextStyle(
                    fontSize: 18,
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
