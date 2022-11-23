import 'package:flutter/material.dart';
import 'package:menu_app/app/features/cart/view/cart.dart';
import 'package:menu_app/app/features/home/view_model/home_notifier.dart';
import 'package:menu_app/app/routes/routes.dart';
import 'package:menu_app/app/styles/app_colors.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<HomeNotifier>().fetchMenuApi(context);
    });
    return Scaffold(
      body: context.watch<HomeNotifier>().menuModelList.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: context
                  .read<HomeNotifier>()
                  .menuModelList[0]
                  .tableMenuList
                  .length,
              itemBuilder: (context, index) {
                final data = context
                    .read<HomeNotifier>()
                    .menuModelList[0]
                    .tableMenuList[0]
                    .categoryDishes[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Row(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            image: DecorationImage(
                              image: NetworkImage(
                                data.dishImage.toString(),
                              ),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data.dishName.toString(),
                            ),
                            Text(
                              data.dishPrice.toString(),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.add,
                                  ),
                                ),
                                Text(context
                                    .read<HomeNotifier>()
                                    .count
                                    .toString()),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.minimize,
                                  ),
                                )
                              ],
                            ),
                            ButtonWidget(
                              fn: () {
                                AppRoutes.nxtScreen(
                                  const CartScreen(),
                                );
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({Key? key, required this.fn}) : super(key: key);
  final VoidCallback fn;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: fn,
      child: const Text("Add"),
    );
  }
}
