import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_night_flutter/model/movide_model.dart';

class TextSwiper extends StatelessWidget {
  const TextSwiper({super.key, required this.resultItem});
  final Result resultItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.black.withOpacity(1),
            Colors.black.withOpacity(0.3),
            Colors.black.withOpacity(0),
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            resultItem.title,
            style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
          ),
          Text(
            maxLines: 3,
            resultItem.overview,
            style: CupertinoTheme.of(context).textTheme.textStyle,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Icon(
                CupertinoIcons.star_fill,
                color: CupertinoColors.systemYellow,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                resultItem.voteAverage.toString(),
                style: CupertinoTheme.of(context).textTheme.navTitleTextStyle,
              ),
            ],
          )
        ],
      ),
    );
  }
}
