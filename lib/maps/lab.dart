part of game;

class LabSprite extends SpriteComponent with HasGameRef<STEMOdyssey> {
  final Future<MCSprite> Function(Vector2) mcSprite;

  LabSprite({
    required this.mcSprite,
  });

  @override
  Future<void> onLoad() async {
    sprite = Sprite(
      await Flame.images.load('Lab.png'),
      srcPosition: Vector2.all(STEMOdyssey.tileSize * 20),
    );
    size = Vector2.all(STEMOdyssey.tileSize * 40);
    final MCSprite mcs = await mcSprite(
      Vector2.all(STEMOdyssey.tileSize * 20),
    );
    addAll([
      NPCSprite(
        imgSrc: 'npc_guard.png',
        position: position +
            Vector2(
              10 * STEMOdyssey.tileSize,
              20 * STEMOdyssey.tileSize,
            ),
      ),
      NPCSprite(
        imgSrc: 'npc_guard.png',
        position: position +
            Vector2(
              28 * STEMOdyssey.tileSize,
              24 * STEMOdyssey.tileSize,
            ),
      ),
      mcs,
    ]);
    game.camera.followComponent(mcs);
  }
}
