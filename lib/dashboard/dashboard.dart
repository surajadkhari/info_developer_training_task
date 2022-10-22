import 'package:flutter/material.dart';

import 'service/flower_model.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(children: [
          ...flowerList.map((e) => FlowerCard(
                cardindex: flowerList.indexOf(e),
                flowerName: e.flowerName,
                image: e.image,
                price: e.price,
              )),
          // SizedBox(

          //   height: screenSize.height,
          //   child: ListView.builder(
          //       itemCount: flowerList.length,
          //       itemBuilder: (context, index) {
          //         var e = flowerList[index];

          //         return FlowerCard(
          //           cardindex: index,
          //           flowerName: e.flowerName,
          //           image: e.image,
          //           price: e.price,
          //         );
          // //       }),
        ]),
      ),
    );
  }
}

class FlowerCard extends StatelessWidget {
  const FlowerCard(
      {super.key,
      required this.price,
      required this.flowerName,
      required this.image,
      this.priceTextColor = Colors.white,
      this.priceTextSize = 14,
      required this.cardindex});

  final String price;
  final String flowerName;
  final String image;
  final double priceTextSize;
  final Color priceTextColor;
  final int cardindex;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      height: screenSize.height * 0.25,
      width: screenSize.width,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: cardColor[cardindex],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Price $price",
                style:
                    TextStyle(fontSize: priceTextSize, color: priceTextColor),
              ),
              Text(
                flowerName,
                style: textstle[cardindex],
              )
            ],
          ),
          Image.network(image)
        ],
      ),
    );
  }
}
