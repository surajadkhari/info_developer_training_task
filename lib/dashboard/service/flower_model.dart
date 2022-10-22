import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class FlowerModel {
  final String price;
  final String flowerName;
  final String image;

  FlowerModel({
    required this.price,
    required this.flowerName,
    required this.image,
  });
}

List<FlowerModel> flowerList = [
  FlowerModel(
      price: "10",
      flowerName: "Red Flower",
      image:
          "https://images.pexels.com/photos/4040650/pexels-photo-4040650.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"),
  FlowerModel(
      price: "20",
      flowerName: "Vlue Flower",
      image:
          "https://images.pexels.com/photos/4040650/pexels-photo-4040650.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"),
];

List<Color> cardColor = [
  Colors.red,
  Colors.blue,
];

List<TextStyle> textstle = [
  const TextStyle(color: Colors.white),
  const TextStyle(color: Colors.purple)
];
