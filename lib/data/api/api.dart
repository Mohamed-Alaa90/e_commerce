import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/api/api_constans.dart';
import 'package:e_commerce/data/model/request/RegisterRequest.dart';
import 'package:e_commerce/data/model/response/RegisterResponseDto.dart';
import 'package:e_commerce/domain/entities/failurs.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<Either<Failures, RegisterResponseDto>> register(
    String name,
    String email,
    String password,
    String rePassword,
    String phone,
  ) async {
    var connectivityResult =
        await Connectivity().checkConnectivity(); // User defined class
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiConstants.baseUrl, ApiEndPoint.registerEndPoint);
      var registerRequest = RegisterRequest(
        email: email,
        name: name,
        password: password,
        phone: phone,
        rePassword: rePassword,
      );
      var response = await http.post(url, body: registerRequest);

      var registerResponse = RegisterResponseDto.fromJson(
        jsonDecode(response.body),
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(registerResponse);
      } else {
        return Left(ServerError(errorMessage: registerResponse.message));
      }
    } else {
      return Left(
        NetworkError(errorMessage: 'Please Check Internet Connection'),
      );
    }
  }
}
