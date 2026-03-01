import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/coffee.dart';

class CoffeeRepository {
  Future<List<Coffee>> getCoffees() async {
    try {
      final String response = await rootBundle.loadString(
        'assets/data/coffees.json',
      );
      final List<dynamic> data = json.decode(response);
      return data.map((json) => Coffee.fromJson(json)).toList();
    } catch (e) {
      print('Error loading coffee data: $e');
      return [];
    }
  }
}
