import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:faker_dart/faker_dart.dart';
import 'package:tutorial_fitur_favorite/module/service/db_service/db_service.dart';

class ProductService {
  Future<List> getProducts() async {
    var response = await Dio().get(
      "https://capekngoding.com/latihan102/api/products",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    Map obj = response.data;
    return obj["data"];
  }

  deleteAllProducts() async {
    await Dio().delete(
      "https://capekngoding.com/latihan102/api/products/action/delete-all",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
  }

  generateProducts() async {
    await deleteAllProducts();
    for (var i = 1; i <= 10; i++) {
      String productName = Faker.instance.commerce.productName();
      await Dio().post(
        "https://capekngoding.com/latihan102/api/products",
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
        data: {
          "photo": Faker.instance.image.loremPicsum.image(
            seed: productName,
          ),
          "product_name": productName,
          "price": Random().nextInt(1000) + 100,
        },
      );
    }
  }

  ///
  addToFavortie(Map item) {
    List favoriteList = jsonDecode((DBService.get("favortie_list") ?? "[]"));
    favoriteList.add(item);
    DBService.set('favortie_list', jsonEncode(favoriteList));
  }

  removeFromFavortie(Map item) {
    List favoriteList = jsonDecode((DBService.get("favortie_list") ?? "[]"));
    favoriteList.removeWhere((i) => i["id"] == item["id"]);
    DBService.set('favortie_list', jsonEncode(favoriteList));
  }

  getFavortieProductList() {
    List favoriteList = jsonDecode((DBService.get("favortie_list") ?? "[]"));
    return favoriteList;
  }

  clearFavoriteProductList() {
    DBService.set('favortie_list', jsonEncode([]));
  }

  isFavorite(Map item) {
    List favoriteList = jsonDecode((DBService.get("favortie_list") ?? "[]"));
    var index = favoriteList.indexWhere((i) => i["id"] == item["id"]);
    return index > -1;
  }
}
