import "dart:convert";
import "dart:developer";

import "package:http/http.dart" as http;
import "package:http/http.dart";
import "package:http_parser/http_parser.dart";
import "api_constants.dart";

class Api {


  //methods
  static Future<String?> getData({required String api, required Map<String, String> params}) async {
    final Uri url = Uri.https(ApiConstants.baseUrl, api, params);
    final http.Response response = await http.get(url, headers: ApiConstants.headers);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  static Future<String?> postData({required String api, required Map<String, dynamic> body}) async {
    final Uri url = Uri.https(ApiConstants.baseUrl, api);
    log("$url     post functional");
    final Response response = await http.post(url, headers: ApiConstants.headers, body: jsonEncode(body));
    log(response.statusCode.toString());
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  static Future<String?> putData({required String api, required Map<String, dynamic> body, required Map<String, dynamic> param}) async {
    final Uri url = Uri.https(ApiConstants.baseUrl, api, param);
    final http.Response response = await http.put(url, body: jsonEncode(body), headers: ApiConstants.headers);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    } else {
      return null;
    }
  }

  static Future<String?> MULTIPART(
      String api, String filePath, Map<String, String> body) async {
    final Uri uri = Uri.http(ApiConstants.baseUrl, api);
    final http.MultipartRequest request = MultipartRequest("POST", uri);
    request.headers.addAll(ApiConstants.headers);
    request.files.add(await MultipartFile.fromPath("file", filePath,
        contentType: MediaType("file", "png")));
    request.fields.addAll(body);
    final StreamedResponse response = await request.send();
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.stream.bytesToString();
    } else {
      return response.reasonPhrase;
    }
  }

  static Future<String?> PATCH(
      String api, Map<String, String> params, Map<String, dynamic> body) async {
    final Uri url = Uri.http(ApiConstants.baseUrl, api);
    final http.Response response =
    await http.patch(url, headers: ApiConstants.headers, body: jsonEncode(body));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  static Future<String?> deleteData(String api, Map<String, String> params) async {
    final Uri url = Uri.http(ApiConstants.baseUrl, api, params);
    final http.Response response = await http.delete(url, headers: ApiConstants.headers);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }



}
