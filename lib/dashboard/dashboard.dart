import 'package:flutter/material.dart';

import '../const/app_const.dart';
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
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: const [
          SizedBox(
            height: 200,
          ),
          Center(child: Text("Sorry it is not available🙏")),
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: const [
          SizedBox(
            height: 200,
          ),
          Center(child: Text("Sorry it is not available🙏")),
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: const [
          SizedBox(
            height: 200,
          ),
          Center(child: Text("Sorry it is not available🙏")),
        ],
      ),
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppConst.primaryColor,
          unselectedItemColor: AppConst.primaryColor,
          items: const [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(
                Icons.spa_outlined,
                size: 30,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Project',
              icon: Icon(
                Icons.manage_search_outlined,
                size: 30,
              ),
            ),
            BottomNavigationBarItem(
              label: 'About Us',
              icon: Icon(
                Icons.shopping_cart_outlined,
                size: 30,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Our Team',
              icon: Icon(
                Icons.favorite_border_outlined,
                size: 30,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Contact',
              icon: Icon(
                Icons.person_outline_outlined,
                size: 30,
              ),
            ),
          ]),
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
                                        : const Color(0xff336351)
                                            .withOpacity(0.5),
                                  ),
                                  color: tapIndex == index
                                      ? const Color(0xff336351)
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Text(
                                tabList[index].toUpperCase(),
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
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
                            fontSize: 24,
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
