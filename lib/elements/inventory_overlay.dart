part of game;

class InventoryOverlay extends StatelessWidget {
  final STEMOdyssey game;
  final GameData gameData;
  late final List<UnlockableItem> unlockables;

  InventoryOverlay({
    required this.game,
    required this.gameData,
  }) {
    unlockables = gameData.journeyData.unlockables;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 700,
        height: 700,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(height: 70),
              const Text(
                'Unlocked Items',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                ),
              ),
              const SizedBox(height: 40),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 10,
                  childAspectRatio: 1,
                  children: List<Widget>.generate(60, (i) {
                    Widget item(String? childSrc) {
                      return Center(
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.blue.shade900,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: childSrc != null
                              ? Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: Container(
                                    child: Image(
                                      image: AssetImage(childSrc),
                                    ),
                                  ),
                                )
                              : null,
                        ),
                      );
                    }

                    if (i < unlockables.length) {
                      return item(unlockables[i].imgSrc);
                    } else {
                      return item(null);
                    }
                  }),
                ),
              ),
              TextButton(
                onPressed: () {
                  game.overlays.remove('inventory_overlay');
                },
                child: const Text(
                  'Dismiss',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
