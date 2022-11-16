class MissionQuestionnaireModel {
  final bool? isCompleted;
  final String? missionName;
  final String? missionId;
  final String? questionnaireDescription;
  final int? missionRating;

  MissionQuestionnaireModel({
    required this.isCompleted,
    required this.missionId,
    required this.missionName,
    this.missionRating,
    this.questionnaireDescription,
  });
}
