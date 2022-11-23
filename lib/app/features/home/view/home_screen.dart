import 'package:flutter/material.dart';
import 'package:menu_app/app/styles/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Row(
                  children: [
                    Container(
                      color: AppColors.primary,
                      width: 100,
                      height: 100,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text("Dish name"),
                        Text("Dish price"),
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
