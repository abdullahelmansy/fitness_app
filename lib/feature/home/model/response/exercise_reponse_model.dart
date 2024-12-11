class ExerciseResponseModel {
  bool? success;
  Data? data;

  ExerciseResponseModel({this.success, this.data});

  ExerciseResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Null previousPage;
  String? nextPage;
  int? totalPages;
  int? totalExercises;
  int? currentPage;
  List<Exercises>? exercises;

  Data(
      {this.previousPage,
      this.nextPage,
      this.totalPages,
      this.totalExercises,
      this.currentPage,
      this.exercises});

  Data.fromJson(Map<String, dynamic> json) {
    previousPage = json['previousPage'];
    nextPage = json['nextPage'];
    totalPages = json['totalPages'];
    totalExercises = json['totalExercises'];
    currentPage = json['currentPage'];
    if (json['exercises'] != null) {
      exercises = <Exercises>[];
      json['exercises'].forEach((v) {
        exercises!.add(Exercises.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['previousPage'] = previousPage;
    data['nextPage'] = nextPage;
    data['totalPages'] = totalPages;
    data['totalExercises'] = totalExercises;
    data['currentPage'] = currentPage;
    if (exercises != null) {
      data['exercises'] = exercises!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Exercises {
  String? exerciseId;
  String? name;
  String? gifUrl;
  List<String>? instructions;
  List<String>? targetMuscles;
  List<String>? bodyParts;
  List<String>? equipments;
  List<String>? secondaryMuscles;

  Exercises(
      {this.exerciseId,
      this.name,
      this.gifUrl,
      this.instructions,
      this.targetMuscles,
      this.bodyParts,
      this.equipments,
      this.secondaryMuscles});

  Exercises.fromJson(Map<String, dynamic> json) {
    exerciseId = json['exerciseId'];
    name = json['name'];
    gifUrl = json['gifUrl'];
    instructions = json['instructions'].cast<String>();
    targetMuscles = json['targetMuscles'].cast<String>();
    bodyParts = json['bodyParts'].cast<String>();
    equipments = json['equipments'].cast<String>();
    secondaryMuscles = json['secondaryMuscles'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['exerciseId'] = exerciseId;
    data['name'] = name;
    data['gifUrl'] = gifUrl;
    data['instructions'] = instructions;
    data['targetMuscles'] = targetMuscles;
    data['bodyParts'] = bodyParts;
    data['equipments'] = equipments;
    data['secondaryMuscles'] = secondaryMuscles;
    return data;
  }
}
