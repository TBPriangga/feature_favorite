import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared/util/snackbar/snackbar_default.dart';
import '../../favorite/controller/favorite_controller.dart';
import '../../service/product_service/product_service.dart';
import '../event/dashboard_bloc_event.dart';
import '../state/dashboard_bloc_state.dart';

mixin _BlocLifecycle {
  void initState() {}
  void dispose() {}
}

class DashboardBlocBloc extends Bloc<DashboardBlocEvent, DashboardBlocState>
    with _BlocLifecycle {
  DashboardBlocBloc() : super(DashboardBlocState()) {
    on<DashboardBlocIncrementEvent>((event, emit) {
      state.counter++;
      emit(state.copyWith());
    });
    on<DashboardBlocGetProductEvent>((event, emit) async {
      state.products = await ProductService().getProducts();
      emit(state.copyWith());
    });
    on<DashboardBlocGenereateProductEvent>((event, emit) async {
      await ProductService().generateProducts();
      add(DashboardBlocGetProductEvent());
    });
    on<DashboardBlocAddToFavorite>((event, emit) async {
      await ProductService().addToFavortie(event.item);
      await FavoriteController.instance.getFavoriteProducts();
      snowSnackBarPrimary("Berhasil menambahkan ke Favorite");
      emit(state.copyWith());
    });
    on<DashboardBlocRemoveFromFavorite>((event, emit) async {
      await ProductService().removeFromFavortie(event.item);
      await FavoriteController.instance.getFavoriteProducts();
      emit(state.copyWith());
    });
  }

  @override
  void initState() {
    //initState event
    add(DashboardBlocGetProductEvent());
    super.initState();
  }

  @override
  void dispose() {
    //dispose event
    super.dispose();
  }

  @override
  Future<void> close() {
    dispose();
    return super.close();
  }
}
