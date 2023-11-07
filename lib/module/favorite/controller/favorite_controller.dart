// ignore_for_file: unnecessary_import

import 'package:flutter/material.dart';
import 'package:tutorial_fitur_favorite/core.dart';
import 'package:tutorial_fitur_favorite/module/service/product_service/product_service.dart';
import '../view/favorite_view.dart';

class FavoriteController extends State<FavoriteView> {
  static late FavoriteController instance;
  late FavoriteView view;

  @override
  void initState() {
    instance = this;
    getFavoriteProducts();
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  List products = [];
  getFavoriteProducts() async {
    products = await ProductService().getFavortieProductList();
    setState(() {});
  }

  clearFavoriteProducts() async {
    await ProductService().clearFavoriteProductList();
    await getFavoriteProducts();
  }

  removeFromFavorite(Map item) async {
    await ProductService().removeFromFavortie(item);
    await FavoriteController.instance.getFavoriteProducts();
    await DashboardController.instance.getProducts();
    setState(() {});
  }
}
