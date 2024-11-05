import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:school/constants/color.dart';
import 'package:school/models/category.dart';
import 'package:school/widgets/category_card.dart';
import 'package:school/widgets/circle_button.dart';
import 'package:school/widgets/search_Field.dart';

class FeaturedScreen extends StatefulWidget {
  const FeaturedScreen({super.key});

  @override
  State<FeaturedScreen> createState() => _FeatuerdScreenState();
}

class _FeatuerdScreenState extends State<FeaturedScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Scaffold(
          body: Column(
            children: [
              AppBar(),
              Body(),
            ],
          ),
        ));
  }
}

class AppBar extends StatelessWidget {
  const AppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
      height: 200,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        gradient: LinearGradient(colors: [
          Color(0xff886ff2),
          Color(0xff6849ef),
        ], begin: Alignment.topLeft, end: Alignment.bottomLeft),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello, \nGood Morning',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              CircleButton(icon: Icons.notifications, onPressed: () {}),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const SearchTextfield(),
        ],
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Explore Categories',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "See All",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: kPrimaryColor),
                  ))
            ],
          ),
        ),
        GridView.builder(
            shrinkWrap: true,
            itemCount: categoryList.length,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              crossAxisSpacing: 20,
              mainAxisSpacing: 24,
            ),
            itemBuilder: (context, index) {
              return CategoryCard(category: categoryList[index]);
            })
      ],
    );
  }
}
