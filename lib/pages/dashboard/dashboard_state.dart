part of 'dashboard_bloc.dart';

class DashboardState extends Equatable {
  final String? routeName;
  final DashboardTab tab;

  const DashboardState({
    this.routeName,
    required this.tab,
  });

  @override
  List<Object?> get props => [
        routeName,
        tab,
      ];
}

class DashboardInitial extends DashboardState {
  const DashboardInitial()
      : super(
          tab: DashboardTab.home,
        );
}

class DashboardSessionUpdated extends DashboardState {
  DashboardSessionUpdated()
      : super(
          tab: DashboardTab.home,
        );

  @override
  List<dynamic> get props => [
        ...super.props,
        UniquePropProvider.get(),
      ];
}

class PopTabToRoot extends DashboardState {
  PopTabToRoot({
    super.routeName,
    required super.tab,
  });

  @override
  List<dynamic> get props => [
        ...super.props,
        UniquePropProvider.get(),
      ];
}
