class Endpoints {
  static final _Families families = _Families();
  static final _Users users = _Users();

  const Endpoints._();
}

class _Users {
  final String user = 'users';
}

class _Families {
  final String families = 'families';
  final String parent = 'parent';
  final String player = 'player';
}