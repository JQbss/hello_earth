class MissionQuestionnaireModel {
  final bool? isCompleted;
  final String? missionName;
  final String? missionId;
  final String? questionnaireDescription;
  final double? missionRating;

  MissionQuestionnaireModel({
    required this.isCompleted,
    required this.missionId,
    required this.missionName,
    required this.missionRating,
    required this.questionnaireDescription,
  });
}