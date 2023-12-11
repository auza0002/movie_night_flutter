import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_night_flutter/model/movide_model.dart';
import 'package:movie_night_flutter/providers/card_provider.dart';
import 'package:movie_night_flutter/providers/movive_provider.dart';
import 'package:movie_night_flutter/widgets/swiper_widgets/text_swiper.dart';
import 'package:provider/provider.dart';

class SwiperCard extends StatefulWidget {
  const SwiperCard(
      {super.key, required this.resultItem, required this.isFront});
  final Result resultItem;
  final bool isFront;

  @override
  State<SwiperCard> createState() => _SwiperCardState();
}

class _SwiperCardState extends State<SwiperCard> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final size = MediaQuery.of(context).size;
      final provider = context.read<CardProvider>();
      provider.setScreenSize(size);
    });
  }

  @override
  Widget build(BuildContext context) {
    return buildFrontCard();
  }

  Widget buildFrontCard() => GestureDetector(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final provider = context.watch<CardProvider>();
            final position = provider.position;
            final milliseconds = provider.isDragging ? 0 : 200;

            final center = constraints.smallest.center(Offset.zero);
            final angle = provider.angle * pi / 180;
            final rotatedMatrix = Matrix4.identity()
              ..translate(center.dx, center.dy)
              ..rotateZ(angle)
              ..translate(-center.dx, -center.dy);

            return AnimatedContainer(
              curve: Curves.easeInOut,
              duration: Duration(milliseconds: milliseconds),
              transform: rotatedMatrix..translate(position.dx, position.dy),
              child: Stack(children: [
                buildCard(),
              ]),
            );
          },
        ),
        onPanStart: (details) {
          context.read<CardProvider>().startPosition(details);
        },
        onPanUpdate: (details) {
          context.read<CardProvider>().updatePosition(details);
        },
        onPanEnd: (details) {
          context.read<CardProvider>().endPosition(widget.resultItem.id);
        },
      );

  Widget buildCard() => ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: 600,
          width: 350,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                context
                    .read<MoviesProvider>()
                    .imgPach(widget.resultItem.posterPath),
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: TextSwiper(resultItem: widget.resultItem),
        ),
      );
}
