import 'dart:convert';
import '../models/Coffee.dart';
import 'package:http/http.dart' as http;

class CoffeeServices {

  Future<Coffee> getCoffees() async {
    var response = await http.get(Uri.parse("https://api.sampleapis.com/coffee/hot"));

    print("response get coffeess: ${response.body}");
    if(response.statusCode == 200) {
      return Coffee.fromJson(json.decode(response.body));
    } else {
      throw("Failed to load coffees");
    }
  }
}