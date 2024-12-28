import 'package:flutter/material.dart';
import 'package:new_project/core/utils/text_style.dart';

class ExerciseCartWidget extends StatelessWidget {
  const ExerciseCartWidget(
      {super.key,
      required this.name,
      required this.imageUrl,
      required this.bodyParts,
      this.onTap});
  final String name;
  final String imageUrl;
  final String bodyParts;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imageUrl,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: getBodyTextStyle(context),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Body of Part : $bodyParts",
                    style: getSmallTextStyle(context),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
