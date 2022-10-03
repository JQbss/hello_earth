class Endpoints {
  static final _Families families = _Families();
  static final _Missions missions = _Missions();
  static final _Users users = _Users();

  const Endpoints._();
}

class _Families {
  final String families = 'families';
  final String parent = 'parent';
  final String player = 'player';
}

class _Missions {
  final String mainMissions = 'mainMissions';
}

class _Users {
  final String user = 'users';
}
