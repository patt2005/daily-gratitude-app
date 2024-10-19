import 'dart:convert';
import 'package:daily_gratitude_journal/models/post.dart';
import 'package:daily_gratitude_journal/models/quote.dart';
import 'package:daily_gratitude_journal/services/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class JournalService extends ChangeNotifier {
  Quote _quote = Quote(text: "", author: "");
  final List<Post> _posts = [];

  List<Post> get posts => _posts;
  Quote get quote => _quote;

  JournalService() {
    _loadPosts();
  }

  Future<void> addPost(Post post) async {
    _posts.add(post);
    await _saveChanges();
    notifyListeners();
  }

  Future<void> getQuote() async {
    _quote = await ApiService.instance.getQuote();
    notifyListeners();
  }

  Future<void> _saveChanges() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> postStrings =
        _posts.map((post) => jsonEncode(post.toJson())).toList();
    await prefs.setStringList('posts', postStrings);
  }

  Future<void> _loadPosts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? postStrings = prefs.getStringList('posts');
    if (postStrings != null) {
      _posts.clear();
      _posts.addAll(
        postStrings.map(
          (postString) => Post.fromJson(jsonDecode(postString)),
        ),
      );
      notifyListeners();
    }
  }
}
