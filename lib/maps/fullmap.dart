part of game;

class FullmapSprite extends SpriteComponent {
  final Future<MCSprite> Function(Vector2) mcSprite;
  FullmapSprite({
    required this.mcSprite,
  });
  @override
  Future<void> onLoad() async {
    sprite = Sprite(await Flame.images.load('Spawn.png'));
    size = Vector2.all(STEMOdyssey.tileSize * 190);
    addAll([
      await mcSprite(
        Vector2(
          STEMOdyssey.tileSize * 87,
          STEMOdyssey.tileSize * 90,
        ),
      )
    ]);
  }
}
