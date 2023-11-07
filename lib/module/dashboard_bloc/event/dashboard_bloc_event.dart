abstract class DashboardBlocEvent {}

class DashboardBlocIncrementEvent extends DashboardBlocEvent {}

class DashboardBlocGetProductEvent extends DashboardBlocEvent {}

class DashboardBlocGenereateProductEvent extends DashboardBlocEvent {}

class DashboardBlocAddToFavorite extends DashboardBlocEvent {
  final Map item;
  DashboardBlocAddToFavorite({required this.item});
}

class DashboardBlocRemoveFromFavorite extends DashboardBlocEvent {
  final Map item;
  DashboardBlocRemoveFromFavorite({required this.item});
}
