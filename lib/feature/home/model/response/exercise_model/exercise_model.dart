class ExerciseModel {
  String? bodyPart;
  String? equipment;
  String? gifUrl;
  String? id;
  String? name;
  String? target;
  List<String>? secondaryMuscles;
  List<String>? instructions;

  ExerciseModel({
    this.bodyPart,
    this.equipment,
    this.gifUrl,
    this.id,
    this.name,
    this.target,
    this.secondaryMuscles,
    this.instructions,
  });

  factory ExerciseModel.fromJson(Map<String, dynamic> json) => ExerciseModel(
        bodyPart: json['bodyPart'] as String?,
        equipment: json['equipment'] as String?,
        gifUrl: json['gifUrl'] as String?,
        id: json['id'] as String?,
        name: json['name'] as String?,
        target: json['target'] as String?,
        secondaryMuscles: (json['secondaryMuscles'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList(),
        instructions: (json['instructions'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'bodyPart': bodyPart,
        'equipment': equipment,
        'gifUrl': gifUrl,
        'id': id,
        'name': name,
        'target': target,
        'secondaryMuscles': secondaryMuscles,
        'instructions': instructions,
      };
}
