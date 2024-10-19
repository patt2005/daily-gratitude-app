import 'dart:convert';
import 'package:daily_gratitude_journal/models/quote.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static ApiService instance = ApiService();

  Future<Quote> getQuote() async {
    const String apiKey = "QP62Yb1qyUlTqMt172Z/bg==iH57LfkyGHsWJvVZ";
    const apiUrl = "https://api.api-ninjas.com/v1/quotes?category=happiness";

    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {'X-Api-Key': apiKey},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      return Quote(
        text: data[0]["quote"],
        author: data[0]["author"],
      );
    } else {
      throw Exception('Failed to load quote');
    }
  }
}
