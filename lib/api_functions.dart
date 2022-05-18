import 'dart:convert';
import 'package:http/http.dart' as http;

Future<dynamic> getGeocode() async {
  var api = 'naveropenapi.apigw.ntruss.com';
  var path = 'map-geocode/v2/geocode';
  var body = {
    'query': '한동로558',
  };
  final response = await http.get(Uri.https(api, path, body), headers: {
    'Accept': 'application/json',
    'X-NCP-APIGW-API-KEY-ID': 'ibeqc6ahvt',
    'X-NCP-APIGW-API-KEY': 'X8Hx3tcFgnufa6zP8jGzMrJIrOai4k8QPg1IB1em',
  });
  print(jsonDecode((response.body)));
  if (response.statusCode == 200) {
    print(jsonDecode((response.body))['data']);
    // return WeatherModel.fromDs(jsonDecode((response.body))['data']);
  } else {
    print(response.statusCode);
    print(response.body);
    // throw Exception('Failed to load weather');
    // return WeatherModel();
  }
}

Future<dynamic> getSummary(String id) async {
  var api = 'map.naver.com';
  var path = 'v5/api/sites/summary/$id'; // 11679461
  var body = {
    'query': '한동로558',
  };
  final response = await http
      .get(Uri.https(api, path, body), headers: {'Accept': 'application/json'});
  print(jsonDecode((response.body)));
  if (response.statusCode == 200) {
    print(jsonDecode((response.body))['data']);
    // return WeatherModel.fromDs(jsonDecode((response.body))['data']);
  } else {
    print(response.statusCode);
    print(response.body);
    // throw Exception('Failed to load weather');
    // return WeatherModel();
  }
}

Future<dynamic> searchPlaces(String query) async {
  var api = 'map.naver.com';
  var path = 'v5/api/search';
  var body = {
    'caller': 'app', // pcweb 큰 상관 없는 듯
    'query': query, // 검색어
    'type': 'all',
    'searchCoord': '127.0856015000004;37.571398300000254',
    'page': '1',
    'displayCount': '20',
    'isPlaceRecommendationReplace': 'true',
    'lang': 'ko',
  };
  final response = await http
      .get(Uri.https(api, path, body), headers: {'Accept': 'application/json'});
  // print(jsonDecode((response.body)));
  if (response.statusCode == 200) {
    print(jsonDecode((response.body))['result']['place']['list']);
    // return WeatherModel.fromDs(jsonDecode((response.body))['data']);
  } else {
    print(response.statusCode);
    print(response.body);
    // throw Exception('Failed to load weather');
    // return WeatherModel();
  }
}
