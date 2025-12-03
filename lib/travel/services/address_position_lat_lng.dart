import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> getAddressFromLatLng(double lat, double lng) async {
  final apiKey = "AIzaSyCF-G92s-uEnbhpEtvEJtYq_Ks8hDYh9jA";

  final url = Uri.parse(
    "https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=$apiKey",
  );

  final response = await http.get(url);
  final data = jsonDecode(response.body);

  if (data["status"] == "OK") {
    final results = data["results"];
    if (results.isNotEmpty) {
      return results[0]["formatted_address"];
    }
  }

  // Si no se encuentra nada → devolver "Destino"
  return "Destino";
}
