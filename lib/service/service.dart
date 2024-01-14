import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:random_quote_generator/model/quote.dart';

class QuoteService {
  Future<List<Quote>> fetchData() async {
    final response = await http.get(
      Uri.parse(
        'https://api.api-ninjas.com/v1/quotes?category=knowledge',
      ),
      headers: {
        'X-Api-Key': 'gRJYaYhP7kA/Gmmp9WO8UQ==iN7tSYLBHpgDRe2S',
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<Quote> quotes = data.map((quote) => Quote.fromJson(quote)).toList();

      return quotes;
    } else {
      throw Exception('Failed to Load');
    }
  }
}
