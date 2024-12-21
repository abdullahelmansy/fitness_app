import 'dart:developer';
import 'package:new_project/core/constants/api_constant.dart';
import 'package:new_project/core/dio/dio_provider.dart';
import 'package:new_project/feature/home/model/response/exercise_model/exercise_model.dart';

class ExerciseRepo {
  static Future<List<ExerciseModel>?> getExercises({int page = 1, int limit = 50}) async {
    try {
      var response = await DioProvider.get(
        endpoint: ApiConstant.exerciseEndpoint,
        queryParameters: {'page': page, 'limit': limit},
        headers: {
          'x-rapidapi-key': ApiConstant.exerciseApiKey,
          'x-rapidapi-host': 'exercisedb.p.rapidapi.com',
        },
      );
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        return data.map((json) => ExerciseModel.fromJson(json)).toList();
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<List<ExerciseModel>?> searchExercises({required String query, int page = 1, int limit = 10}) async {
    try {
      var response = await DioProvider.get(
        endpoint: ApiConstant.exerciseEndpoint,
        queryParameters: {
          'page': page,
          'limit': limit,
          'query': query,
        },
      );
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        return data.map((json) => ExerciseModel.fromJson(json)).toList();
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
