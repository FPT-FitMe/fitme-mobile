import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fitme/configs/http_service.dart';
import 'package:fitme/models/coach.dart';
import 'package:fitme/repository/coach_repository.dart';

class CoachService implements CoachRepository {
  Dio dio = new HttpService().dio;

  @override
  Future<List<Coach>> getAllCoaches() async {
    final response = await dio.get("/coachs");
    return (response.data as List)
        .map((coach) => Coach.fromJson(coach))
        .toList();
  }
}
