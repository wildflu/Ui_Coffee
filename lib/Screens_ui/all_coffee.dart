

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AllCoffee extends StatelessWidget {
  const AllCoffee({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 5,right: 5),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, 
            childAspectRatio: 0.65,
            crossAxisSpacing: 5,
            mainAxisSpacing: 10
          ),
          itemCount: 20,
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
        ),
      ),
    );
  }
}