import 'package:flutter/material.dart';

import 'model/flower_model.dart';

class Dashbaord extends StatefulWidget {
  const Dashbaord({super.key});

  @override
  State<Dashbaord> createState() => _DashbaordState();
}

class _DashbaordState extends State<Dashbaord> {
  int tapIndex = 0;
  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    List<String> tabList = ["All", "Collections", "Occasions", "International"];
    List<Widget> section = [
      const AllSection(),
      const Text("Sorry it is not available"),
      const Text("Sorry it is not available"),
      const Text("Sorry it is not available")
    ];
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
          ),
        ],
        title: const Text(
          "Categories",
        ),
      ),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Search category...",
                  suffixIcon: Icon(Icons.search),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(
                      height: 60,
                      width: screen.width,
                      child: ListView.builder(
                        itemCount: tabList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => InkWell(
                          onTap: (() {
                            setState(() {
                              tapIndex = index;
                            });
                          }),
                          child: Container(
                              margin: const EdgeInsets.only(
                                  right: 8, top: 14, bottom: 10),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 10),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: tapIndex == index
                                        ? Colors.white
                                        : const Color(0xff336351),
                                  ),
                                  color: tapIndex == index
                                      ? const Color(0xff336351)
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Text(
                                tabList[index],
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: tapIndex == index
                                      ? Colors.white
                                      : const Color(0xff336351),
                                ),
                              )),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              section[tapIndex],
            ],
          ),
        ),
      ),
    );
  }
}

class AllSection extends StatelessWidget {
  const AllSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Column(
      children: [
        ...flowerList.map(
          (e) => Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            height: 200,
            width: screen.width,
            decoration: BoxDecoration(
                color: cardColor[flowerList.indexOf(e)],
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Under \$${e.price}",
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 30,
                            color: Colors.white),
                      ),
                      const Text(
                        "BOUQUET PRICE",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Expanded(child: Image.asset(e.flower))
              ],
            ),
          ),
        )
      ],
    );
  }
}
