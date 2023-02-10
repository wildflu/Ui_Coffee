import 'dart:ui';

import 'package:coffeeplatf/Screens_ui/all_coffee.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController tabControl0;
  late TabController tabControl1;
  late TabController tabControl2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabControl0 = TabController(length: 3, initialIndex: 0, vsync: this);
    tabControl1 = TabController(length: 3, initialIndex: 0, vsync: this);
    tabControl2 = TabController(length: 3, initialIndex: 0, vsync: this);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.person))],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width - 100,
              alignment: Alignment.centerLeft,
              child: const Text(
                "Find you're faiver \nand best coffee",
                style: TextStyle(
                    fontSize: 30,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              child: TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    prefixIcon: Icon(Icons.search),
                    hintText: "Coffee search"),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TabContX(tabControl: tabControl0),
            const SizedBox(
              height: 10,
            ),
            Container(
              child: const Text(
                "Special For You",
                style: TextStyle(
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TabContX(tabControl: tabControl1),
            const SizedBox(
              height: 10,
            ),
            Container(
              child: const Text(
                "New x",
                style: TextStyle(
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TabContX(tabControl: tabControl2),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: GNav(
              rippleColor: Colors.grey,
              haptic: true,
              tabBorderRadius: 25,
              tabActiveBorder: Border.all(
                  color: Color.fromARGB(255, 195, 167, 167), width: 1),
              duration: Duration(milliseconds: 900),
              gap: 8,
              activeColor: Colors.grey,
              backgroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              onTabChange: (value) {
                print(value);
                switch(value) {
                  case 0:
                    print("page 0");
                    break;
                  case 1:
                    print("page 1");
                    Get.to(()=>AllCoffee());
                    break;
                  case 2:
                    print("page 0");
                    break;
                  case 3:
                    print("page 0");
                    break;
                }
              },
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.menu_open_outlined,
                  text: 'Likes',
                ),
                GButton(
                  icon: Icons.search,
                  text: 'Search',
                ),
                GButton(
                  icon: Icons.settings,
                  text: 'Profile',
                )
              ]),
        ),
      ),
    );
  }
}

class TabContX extends StatelessWidget {
  const TabContX({
    Key? key,
    required this.tabControl,
  }) : super(key: key);
  final TabController tabControl;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: Column(
        children: [
          Container(
            height: 40,
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                controller: tabControl,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.grey,
                labelPadding:
                    const EdgeInsets.only(left: 20, right: 20),
                isScrollable: true,
                indicator: CircleTabIndicator(
                  color: Colors.white,
                  radius: 4,
                ),
                tabs: const [
                  Tab(
                    text: "none",
                  ),
                  Tab(
                    text: "descriptions",
                  ),
                  Tab(
                    text: "some thigs",
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: double.maxFinite,
            height: 270,
            child: TabBarView(
              controller: tabControl,
              children: [
                Container(
                  child: GridTabbarView(),
                ),
                Container(
                  child: GridTabbarView(),
                ),
                Container(
                  child: GridTabbarView(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GridTabbarView extends StatelessWidget {
  const GridTabbarView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 2,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 0.65, crossAxisSpacing: 5),
      itemBuilder: (context, index) {
        return Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.white10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    "assets/a.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 7, bottom: 2),
                  child: Text(
                    "Name-Of-Caffee",
                    style: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
                  ),
                ),
                const Text(
                  "descrip",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w200),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("\$43.9"),
                    CircleAvatar(
                      backgroundColor: Colors.amber,
                      child:
                          IconButton(onPressed: () {
                            print(index);
                          }, icon: Icon(Icons.add)),
                    )
                  ],
                ),
              ],
            ),
          );
      },
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;
  CircleTabIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChange]) {
    return _CirclePainter(
      color: color,
      radius: radius,
    );
  }
}

class _CirclePainter extends BoxPainter {
  final double radius;
  late Color color;

  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    late Paint _paint;
    _paint = Paint()..color = color;
    _paint = _paint..isAntiAlias = true;
    final Offset circleOffset =
        offset + Offset(cfg.size!.width / 2, cfg.size!.height - radius);
    canvas.drawCircle(circleOffset, radius, _paint);
  }
}
