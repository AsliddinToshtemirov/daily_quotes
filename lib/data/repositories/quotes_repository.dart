import 'package:daily_quotes/data/model/services/base_service.dart';
import 'package:daily_quotes/data/model/services/quotes_service.dart';
import 'package:daily_quotes/data/model/quote_model.dart';
import 'package:flutter/material.dart';

class QuotesRepository {
  final BaseService _randomService = RandomService();

  Future<Quotes> fetchQuotes() async {
    dynamic response = await _randomService.getResponse("/random");
    final details = Quotes.fromJson(response);
    debugPrint(details.content);

    return details;
  }
}
