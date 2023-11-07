import 'package:freezed_annotation/freezed_annotation.dart';
part 'dashboard_bloc_state.freezed.dart';

@unfreezed
class DashboardBlocState with _$DashboardBlocState {
  factory DashboardBlocState({
    @Default(0) int counter,
    @Default([]) List products,
  }) = _DashboardBlocState;
}
