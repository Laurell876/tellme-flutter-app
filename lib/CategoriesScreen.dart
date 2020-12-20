import 'package:flutter/material.dart';
import 'Models/Category.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var categories = [
      new Category(id: 1, title: "SCIENCE"),
      new Category(id: 3, title: "MATH"),
      new Category(id: 5, title: "TECH"),
      new Category(id: 6, title: "TECH"),
      new Category(id: 7, title: "SPORTS")
    ];

    return Column(
      children: [
        SizedBox(height: 20),
        Container(
          margin: const EdgeInsets.only(left: 30.0),
          child: Text(
            "Categories",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 30, color: Colors.black),
          ),
        ),
        SizedBox(height: 20),
        Expanded(
          child: GridView.builder(
            itemCount: categories.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 1, mainAxisSpacing: 10),
            itemBuilder: (BuildContext context, int index) {
              return Center(
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.45,
                      height: 200,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      child: Center(
                        child: Text(
                          categories[index].title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1
                          ),
                        ),
                      )));
            },
          ),
        ),
      ],
    );
  }
}
