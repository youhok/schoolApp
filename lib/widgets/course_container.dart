import 'package:flutter/material.dart';
import 'package:school/constants/color.dart';
import 'package:school/models/course.dart';
import 'package:school/screens/detail_screen.dart';

class CourseContainer extends StatelessWidget {
  final Course course;
  const CourseContainer({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context , MaterialPageRoute(builder: (context)=> DetailScreen(
        title:course.name
      ))),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                course.thumbnail,
                height: 60,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(course.name),
                Text(
                  "Author ${course.author}",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 5,),
                LinearProgressIndicator(
                  value: course.completedPercentage,
                  backgroundColor: Colors.black12,
                  color: kPrimaryColor,
                )
              ],
            ),
            ),
          ],
        ),
      ),
    );
  }
}
