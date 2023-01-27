import 'dart:convert';
import 'package:covid19_tracker_app/Services/Utilites/App_Url.dart';
import 'package:http/http.dart' as http;
import '../Models/World_State_Model.dart';

class WorldData {
  static Future<WorldWideStates> getCovidData() async {
    final response = await http.get(Uri.parse(Appurl.worldStateApi));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      return WorldWideStates.fromJson(data);
    } else {
      throw Exception('Error');
    }
  }

  Future<List<dynamic>> getCountriesData() async {
    var dataa;
    final response = await http.get(Uri.parse(Appurl.countriesList));
    if (response.statusCode == 200) {
      return dataa = jsonDecode(response.body.toString());
    } else {
      throw Exception('Error');
    }
  }
}
