import 'package:hive/hive.dart';
import 'dart:convert';
import 'package:daily_gratitude_journal/models/post.dart';
import 'package:daily_gratitude_journal/models/quote.dart';
import 'package:daily_gratitude_journal/services/api_service.dart';
import 'package:flutter/cupertino.dart';

class JournalService extends ChangeNotifier {
  Quote _quote = Quote(text: "", author: "");
  final List<Post> _posts = [];

  List<Post> get posts => _posts;
  Quote get quote => _quote;

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
    final box = Hive.box('journal');
    List<String> postStrings =
        _posts.map((post) => jsonEncode(post.toJson())).toList();
    await box.put('posts', postStrings);
  }

  Future<void> loadPosts() async {
    final box = Hive.box('journal');
    List<dynamic>? postStrings = box.get('posts');
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
