import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:school/constants/color.dart';
import 'package:school/constants/icons.dart';
import 'package:school/models/lesson.dart';
import 'package:school/widgets/custom_icon_button.dart';
import 'package:school/widgets/custom_video_player.dart';
import 'package:school/widgets/lesson_card.dart';

class DetailScreen extends StatefulWidget {
  final String title;

  const DetailScreen({super.key, required this.title});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int _selectedTag = 0;

  void changTab(int index) {
    setState(() {
      _selectedTag = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IntrinsicHeight(
                  child: Stack(
                    children: [
                      Align(
                        child: Text(
                          "Flutter",
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ),
                      Positioned(
                          left: 0,
                          child: CustomIconButton(
                            child: const Icon(Icons.arrow_back),
                            height: 35,
                            width: 35,
                            onTap: () => Navigator.pop(context),
                          )),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const CustomVideoPlayer(),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Flutter Novice to Ninja",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                ),
                const SizedBox(
                  height: 3,
                ),
                const Text(
                  "Create by Youhok",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
                const SizedBox(
                  height: 3,
                ),
                Row(
                  children: [
                    Image.asset(
                      icFeaturedOutlined,
                      height: 20,
                    ),
                    const Text(
                      " 4.8",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Icon(
                      Icons.timer,
                      color: Colors.grey,
                    ),
                    const Text(
                      " 72 Hours",
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                    const Spacer(),
                    const Text(
                      " \$40",
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 20),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTabView(
                  index: _selectedTag,
                  changeTab: changTab,
                ),
                _selectedTag == 0 ? const Playlist() : const Description(),
              ],
            ),
          ),
        ),
        bottomSheet: BottomSheet(
          onClosing: () {},
          backgroundColor: Colors.white,
          enableDrag: false,
          builder: (context) {
            return const SizedBox(
              height: 80,
              child: EnrollBottomSheet(),
            );
          },
        ),
      ),
    );
  }
}

class EnrollBottomSheet extends StatelessWidget {
  const EnrollBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          CustomIconButton(
              child: const Icon(
                Icons.favorite,
                color: Colors.pink,
                size: 30,
              ),
              height: 45,
              width: 45,
              onTap: () {}),
          const SizedBox(
            width: 20,
          ),
          Expanded(
              child: CustomIconButton(
                color: kPrimaryColor,
            child: const Text(
              "Enroll Now",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            height: 45,
            width: 45,
            onTap: (){},
          ),
          )
        ],
      ),
    );
  }
}

class Description extends StatelessWidget {
  const Description({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Text(
          "Build Flutter iOS and Android Apps with a Single Codebase: Learn Google's Flutter Mobile Development Framework & Dart"),
    );
  }
}

class CustomTabView extends StatefulWidget {
  final Function(int) changeTab;
  final int index;
  const CustomTabView({Key? key, required this.changeTab, required this.index})
      : super(key: key);

  @override
  State<CustomTabView> createState() => _CustomTabViewState();
}

class _CustomTabViewState extends State<CustomTabView> {
  final List<String> _tags = ["Playlist (22)", "Description"];

  Widget _buildTags(int index) {
    return GestureDetector(
      onTap: () {
        widget.changeTab(index);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .08, vertical: 15),
        decoration: BoxDecoration(
          color: widget.index == index ? kPrimaryColor : null,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          _tags[index],
          style: TextStyle(
            color: widget.index != index ? Colors.black : Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade200,
      ),
      child: Row(
        children: _tags
            .asMap()
            .entries
            .map((MapEntry map) => _buildTags(map.key))
            .toList(),
      ),
    );
  }
}

class Playlist extends StatelessWidget {
  const Playlist({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.only(top: 20, bottom: 40),
        itemBuilder: (_, index) {
          return LessonCard(lesson: lessonList[index]);
        },
        separatorBuilder: (_, __) {
          return const SizedBox(
            height: 20,
          );
        },
        itemCount: lessonList.length,
      ),
    );
  }
}
