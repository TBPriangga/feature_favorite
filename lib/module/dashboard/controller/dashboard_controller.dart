// ignore_for_file: use_build_context_synchronously, unnecessary_import

import 'package:flutter/material.dart';
import 'package:tutorial_fitur_favorite/core.dart';
import 'package:tutorial_fitur_favorite/module/service/product_service/product_service.dart';
import 'package:tutorial_fitur_favorite/shared/util/snackbar/snackbar_default.dart';
import '../view/dashboard_view.dart';

class DashboardController extends State<DashboardView> {
  static late DashboardController instance;
  late DashboardView view;

  @override
  void initState() {
    instance = this;
    getProducts();
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  List products = [];

  getProducts() async {
    products = await ProductService().getProducts();
    setState(() {});
  }

  generateProducts() async {
    await ProductService().generateProducts();
    await getProducts();
  }

  addToFavorite(Map item) async {
    await ProductService().addToFavortie(item);
    await FavoriteController.instance.getFavoriteProducts();
    snowSnackBarPrimary("Berhasil menambahkan ke Favorite");
    setState(() {});
  }

  removeFromFavorite(Map item) async {
    await ProductService().removeFromFavortie(item);
    await FavoriteController.instance.getFavoriteProducts();
    setState(() {});
  }
}
