class AchievementMock {
  final int? currentAmountOfMileStones;
  final String? description;
  final String? icon;
  final int? mileStones;

  const AchievementMock({
    required this.currentAmountOfMileStones,
    required this.description,
    required this.icon,
    required this.mileStones,
  });

  List<AchievementMock> getListOfAchievementMock() {
    return [
      AchievementMock(
        currentAmountOfMileStones: 3,
        description: 'Wykonaj zadania kulinarne',
        icon: '',
        mileStones: 5,
      ),
      AchievementMock(
        currentAmountOfMileStones: 1,
        description: 'Wykonaj zadania',
        icon: '',
        mileStones: 15,
      ),
    ];
  }
}
