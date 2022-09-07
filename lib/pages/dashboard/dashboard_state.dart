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

class PopTabToRoot extends DashboardState {
  PopTabToRoot({
    String? routeName,
    required DashboardTab tab,
  }) : super(
          tab: tab,
          routeName: routeName,
        );

  @override
  List<dynamic> get props => [
        ...super.props,
        UniquePropProvider.get(),
      ];
}