

import 'dart:convert';

import 'package:proyecto_final_front/config/locator.dart';
import 'package:proyecto_final_front/model/login.dart';
import 'package:proyecto_final_front/model/user.dart';
import 'package:injectable/injectable.dart';

import 'package:proyecto_final_front/rest/rest.dart';

@Order(-1)
@singleton
class UserRepository {

  late RestAuthenticatedClient _client;

  UserRepository() {
    _client = getIt<RestAuthenticatedClient>();
  }

  Future<dynamic> me() async {
    String url = "/me";

    var jsonResponse = await _client.get(url);
    return UserResponse.fromJson(jsonDecode(jsonResponse));

  }





}