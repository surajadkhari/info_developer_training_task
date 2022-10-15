import 'dart:ui';

class FlowerModel {
  final String price;
  final String flower;

  FlowerModel({
    required this.price,
    required this.flower,
  });
}

List<FlowerModel> flowerList = [
  FlowerModel(price: "20", flower: "assets/images/jasmine.png"),
  FlowerModel(
    price: "35",
    flower: 'assets/images/orchid.png',
  ),
  FlowerModel(price: "50", flower: 'assets/images/rose.png'),
  FlowerModel(price: "50", flower: 'assets/images/wepik.png')
];

List<Color> cardColor = [
  const Color(0xff336351),
  const Color(0xff9E8CDF),
  const Color(0xffF99DA3),
  const Color(0xff336351),
  const Color(0xff9E8CDF),
  const Color(0xffF99DA3),
];
