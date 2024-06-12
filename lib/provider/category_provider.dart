import 'package:ecommerce_flutter/model/category_icon_model.dart';
import 'package:ecommerce_flutter/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryProvider with ChangeNotifier {
  List<ProductModel> shirt = [];
  late ProductModel shirtData;
  List<ProductModel> dress = [];
  late ProductModel dressData;
  List<ProductModel> shoes = [];
  late ProductModel shoesData;
  List<ProductModel> pant = [];
  late ProductModel pantData;
  List<ProductModel> tie = [];
  late ProductModel tieData;
  List<CategoryIconModel> dressIcon = [];
  late CategoryIconModel dressIconData;

  Future<void> getDressIconData() async {
    List<CategoryIconModel> newList = [];
    QuerySnapshot dressSnapshot = await FirebaseFirestore.instance
        .collection("category_icon")
        .doc("sgbafdgerhguierhu")
        .collection("dress")
        .get();

    dressSnapshot.docs.forEach(
      (element) {
        final data = element.data() as Map<String, dynamic>;
        dressIconData = CategoryIconModel(image: data['image']);
        newList.add(dressIconData);
      },
    );

    dressIcon = newList;
    notifyListeners();
  }

  List<CategoryIconModel> get getDressIcon {
    return dressIcon;
  }

  List<CategoryIconModel> shirtIcon = [];
  late CategoryIconModel shirtIconData;
  Future<void> getShirtIcon() async {
    List<CategoryIconModel> newList = [];
    QuerySnapshot shirtSnapshot = await FirebaseFirestore.instance
        .collection("category_icon")
        .doc("sgbafdgerhguierhu")
        .collection("shirt")
        .get();

    shirtSnapshot.docs.forEach(
      (element) {
        final data = element.data() as Map<String, dynamic>;
        shirtIconData = CategoryIconModel(image: data['image']);
        newList.add(shirtIconData);
      },
    );

    shirtIcon = newList;
    notifyListeners();
  }

  List<CategoryIconModel> get getShirtIconData {
    return shirtIcon;
  }

  List<CategoryIconModel> shoesIcon = [];
  late CategoryIconModel shoesIconData;
  Future<void> getShoesIconData() async {
    List<CategoryIconModel> newList = [];
    QuerySnapshot shoesSnapshot = await FirebaseFirestore.instance
        .collection("category_icon")
        .doc("sgbafdgerhguierhu")
        .collection("shoes")
        .get();

    shoesSnapshot.docs.forEach(
      (element) {
        final data = element.data() as Map<String, dynamic>;
        shoesIconData = CategoryIconModel(image: data['image']);
        newList.add(shoesIconData);
      },
    );

    shoesIcon = newList;
    notifyListeners();
  }

  List<CategoryIconModel> get getShoesIcon {
    return shoesIcon;
  }

  List<CategoryIconModel> pantIcon = [];
  late CategoryIconModel pantIconData;
  Future<void> getPantIconData() async {
    List<CategoryIconModel> newList = [];
    QuerySnapshot pantSnapshot = await FirebaseFirestore.instance
        .collection("category_icon")
        .doc("sgbafdgerhguierhu")
        .collection("pant")
        .get();
  }
}
