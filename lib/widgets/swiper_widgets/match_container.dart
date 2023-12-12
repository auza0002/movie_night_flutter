import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_night_flutter/model/movide_model.dart';
import 'package:movie_night_flutter/providers/movive_provider.dart';

class MatchContainer extends StatefulWidget {
  const MatchContainer({super.key, required this.match});
  final List<Result> match;

  @override
  State<MatchContainer> createState() => _MatchContainerState();
}

class _MatchContainerState extends State<MatchContainer> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Text(
          "Match Movie",
          style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
        ),
        const SizedBox(height: 20),
        Container(
          color: CupertinoColors.darkBackgroundGray,
          height: size.height * 0.25,
          width: size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 200,
                width: 150,
                child: Image.network(
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const Center(
                      child: CupertinoActivityIndicator(),
                    );
                  },
                  MoviesProvider().imgPach(widget.match[0].posterPath),
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 200,
                width: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      maxLines: 1,
                      widget.match[0].title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      maxLines: 3,
                      widget.match[0].overview,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          CupertinoIcons.star_fill,
                          color: CupertinoColors.systemYellow,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          maxLines: 1,
                          widget.match[0].voteAverage.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
