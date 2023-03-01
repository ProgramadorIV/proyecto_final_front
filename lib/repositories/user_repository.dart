

import 'dart:convert';

import 'package:proyecto_final_front/config/locator.dart';
import 'package:proyecto_final_front/model/login.dart';
import 'package:proyecto_final_front/model/models.dart';
import 'package:proyecto_final_front/model/user.dart';
import 'package:injectable/injectable.dart';

import 'package:proyecto_final_front/rest/rest.dart';

@Order(-1)
@singleton
class UserRepository {

  late RestAuthenticatedClient _authenticatedClient;

  UserRepository() {
    _authenticatedClient = getIt<RestAuthenticatedClient>();
  }

  Future<dynamic> me() async {
    String url = "/me";

    var jsonResponse = await _authenticatedClient.get(url);
    return UserResponse.fromJson(jsonDecode(jsonResponse));

  }
  Future<PostResponse> fectchFavoritePosts(int page) async {
    String url = "/auth/user/like";

    return PostResponse.fromJson(jsonDecode(await _authenticatedClient.get(url)));
  }


}