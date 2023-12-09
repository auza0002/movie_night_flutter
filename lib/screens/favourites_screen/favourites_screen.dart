import 'package:flutter/cupertino.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
          backgroundColor: const Color.fromARGB(188, 0, 0, 0),
          middle: const Text(
            "My Lists",
            style: TextStyle(color: CupertinoColors.white),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CupertinoButton(
                child: const Icon(
                  CupertinoIcons.search,
                  color: CupertinoColors.white,
                ),
                onPressed: () {},
              ),
              CupertinoButton(
                child: const Icon(
                  CupertinoIcons.tv,
                  color: CupertinoColors.white,
                ),
                onPressed: () {},
              )
            ],
          )),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 300,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(237, 95, 27, 1),
                    offset: Offset(0, 0),
                    blurRadius: 30,
                  )
                ],
                shape: BoxShape.circle,
                color: CupertinoColors.white,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/img/MyList.png"),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "It seems like someone stole your lists!",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const Text(
              "Let's find them!",
              style: TextStyle(
                  color: CupertinoColors.inactiveGray,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            CupertinoButton.filled(
              child: const Text(
                "FIND MY LISTS",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
