import 'dart:developer';

import 'package:new_project/core/constants/api_constant.dart';
import 'package:new_project/feature/home/model/response/exercise_reponse_model.dart';
import 'package:new_project/core/dio/dio_provider.dart';

class ExerciseRepo {
  static Future<ExerciseResponseModel?> getExercises(
      {int page = 1, int limit = 1324}) async {
    try {
      var response = await DioProvider.get(
        endpoint: ApiConstant.exerciseEndpoint,
        queryParameters: {'page': page, 'limit': limit},
      );
      if (response.statusCode == 200) {
        var model = ExerciseResponseModel.fromJson(response.data);
        log(model.toString());
        return model;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<ExerciseResponseModel?> searchExercises(
      {required String query, int page = 1, int limit = 50}) async {
    try {
      var response = await DioProvider.get(
        endpoint: ApiConstant.exerciseEndpoint,
        queryParameters: {
          'page': page,
          'limit': limit,
          'query': query
        }, // assuming the API supports this query parameter
      );
      if (response.statusCode == 200) {
        var model = ExerciseResponseModel.fromJson(response.data);
        log(model.toString());
        return model;
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
