part of 'dashboard_bloc.dart';

abstract class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<dynamic> get props => [];
}

class ChangeSessionRequested extends DashboardEvent {
  const ChangeSessionRequested();
}

class ChangeTabRequested extends DashboardEvent {
  final String? routeName;
  final DashboardTab tab;

  const ChangeTabRequested({
    this.routeName,
    required this.tab,
  });

  @override
  List<dynamic> get props => [
        ...super.props,
        routeName,
        tab,
      ];
}
