// import 'dart:async';
// import 'dart:developer';
// import 'package:flutter/foundation.dart';
// import 'package:http_interceptor/models/interceptor_contract.dart';
// import 'package:http_interceptor/http_interceptor.dart';
// import '../storage/app_storage.dart';
//
// class AppInterceptor implements InterceptorContract {
//   @override
//   Future<RequestData> interceptRequest({required RequestData data}) async {
//     if (kDebugMode) {
//       log(
//         "---------[Interceptor]---------ON_REQUEST(${data.method})------------------\n\n"
//             "URL: ${data.url}\n"
//             "HEADERS: ${data.headers}\n"
//             "---------------------------------------------------------------------------\n\n",
//       );
//     }
//
//     return data;
//   }
//
//   @override
//   Future<ResponseData> interceptResponse({required ResponseData data}) async {
//
//
//     if (kDebugMode) {
//       log(
//         "---------[Interceptor]---------ON_RESPONSE(${data.statusCode})------------------\n\n"
//             "HEADERS: ${data.headers}\n"
//             "BODY: ${data.body}\n"
//             "---------------------------------------------------------------------------\n\n",
//       );
//     }
//
//
//     if (data.statusCode == 401) {
//       //   /// 1. eskirgan access va refreshni hotiradan olamiz
//       String? access = await AppStorage.load(key: StorageKey.accessToken);
//       String? refresh = await AppStorage.load(key: StorageKey.refreshToken);
//
//
//       //   /// 2. tokenni yangilaydigan function
//       //   /// 3. Xotiraga yangi tokenlarni yozamiz
//       //   await AppStorage.store(key: StorageKey.accessToken, value: "value");
//       //   await AppStorage.store(key: StorageKey.refreshToken, value: "value");
//
//       //   /// 4. Davom etish...
//
//
//       //   final Map<String, String> updatedHeaders = {
//       //     "Authorization": "Bearer NEWACCESS",
//       //   };
//
//       //   data.request?.headers.forEach((key, value) {
//       //     updatedHeaders[key] = value;
//       //   });
//
//       //   data.request?.headers.addAll(updatedHeaders);
//
//       //   final newRequest = http.Request(data.request!.method.name, data.request!.url.toUri());
//
//       //   final retryResponse = await http.Client().send(newRequest);
//
//       //   await http.Response.fromStream(retryResponse);
//
//     }
//
//     return data;
//   }
//
//   @override
//   FutureOr<bool> shouldInterceptRequest() {
//     // TODO: implement shouldInterceptRequest
//     throw UnimplementedError();
//   }
//
//   @override
//   FutureOr<bool> shouldInterceptResponse() {
//     // TODO: implement shouldInterceptResponse
//     throw UnimplementedError();
//   }
//
// }
//
//
//
